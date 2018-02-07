//
//  LocationService.swift
//  GeographicAPP
//
//  Created by Ali Adam on 2/06/18.
//  Copyright © 2018 Ali Adam. All rights reserved.
//

import UIKit
import CoreLocation
import UserNotifications
class LocationService: NSObject , CLLocationManagerDelegate {
    static let `default` = LocationService()
    var locationManager: CLLocationManager!
    var currentLocation :CLLocation = CLLocation(latitude: 0.0,longitude: 0.0)
    lazy  var  alertController :UIAlertController = {
        let alert = UIAlertController(title: LocalizableWords.errorMessageTile, message:LocalizableWords.gpsErrorMessage , preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: LocalizableWords.goToSettingMessage, style: UIAlertActionStyle.default, handler: { (alert: UIAlertAction!) in
            print("")
            UIApplication.shared.open(NSURL(string:UIApplicationOpenSettingsURLString)! as URL, options:[:], completionHandler: { (result) in
                
            })
        }))
        return alert
    }()
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.activityType = .otherNavigation
        locationManager.distanceFilter = 100.0
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()
        
    }
    
    
    
    func handleRegionEvent(region: CLRegion) {
        // Otherwise present a Local Notification
        
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: LocalizableWords.WelcomeMessage,arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: region.identifier, arguments: nil)
        content.sound = UNNotificationSound.default()
        content.setValue(true, forKey: "shouldAlwaysAlertWhileAppIsForeground")
        content.badge = UIApplication.shared.applicationIconBadgeNumber + 1 as NSNumber;
        content.categoryIdentifier = Bundle.main.bundleIdentifier!
        // Deliver the notification in five seconds.
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest.init(identifier: region.identifier, content: content, trigger: trigger)
        // Schedule the notification.
        let center = UNUserNotificationCenter.current()
        center.add(request)
    }
    
    
    // MARK: - CLLocationManager Delegate Methods
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("enter region\(region.identifier)")
        if region is CLCircularRegion {
            handleRegionEvent(region: region)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Exit region\(region.identifier)")
        //locationManager.stopMonitoring(for: region)
        //        if locationManager.monitoredRegions.count < 2 {
        //            self.locationManager?.startUpdatingLocation()
        //        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Object that is being updated
        print(locations.first!)
        currentLocation =  locations.first!
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkStatus()
    }
    
    
    func checkStatus()  {
        let status = CLLocationManager.authorizationStatus()
        if  status == .denied || status == .authorizedWhenInUse  {
            // present an alert indicating location authorization required
            // and offer to take the user to Settings for the app via
            // UIApplication -openUrl: and UIApplicationOpenSettingsURLString
            DispatchQueue.main.async(execute: {
                UIApplication.shared.keyWindow?.rootViewController?.present(self.alertController, animated: true, completion: nil)
                
            })
            
        }
        else if status == .authorizedAlways {
            alertController.dismiss(animated: true, completion: nil)
        }
        
    }
    
    func createRegion(item:Item) {
        
        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
            let coordinate = item.location
            let regionRadius = 100.0
            let region = CLCircularRegion(center: coordinate!,
                                          radius: regionRadius,
                                          identifier: "\(item.name!)")
            print("create region \(region.identifier)")
            
            region.notifyOnExit = false
            region.notifyOnEntry = true
            locationManager?.startMonitoring(for: region)
        }
        else {
            print("System can't track regions")
        }
    }
    
    func monitorRegions(items:[Item] ) {
        
        var allDistance : [Double] = []
        
        //Calulate distance of each region's center to currentLocation
        for item in items{
            // let circularRegion = region as! CLCircularRegion
            let pointLocation = item.location.map({ CLLocation(latitude: $0.latitude,longitude: $0.longitude)})
            let distance = currentLocation.distance(from: pointLocation!)
            //  points.filter({$0.name == point.name}).distance = distance
            
            //  point.distance = distance
            allDistance.append(distance)
        }
        // a Array of Tuples
        let distanceOfEachRegionToCurrentLocation = zip(items, allDistance)
        
        //sort and get 20 closest
        var twentyNearbyRegions = distanceOfEachRegionToCurrentLocation
            .sorted{ tuple1, tuple2 in return tuple1.1 < tuple2.1 }.prefix(20)
        
        // Remove all regions you were tracking before
        for region in locationManager.monitoredRegions{
            let reg = twentyNearbyRegions.filter({$0.0.name! == region.identifier})
            if reg.count == 1
            {
                let index = twentyNearbyRegions.index(where: {$0.0.name! == reg.first?.0.name! })
                twentyNearbyRegions.remove(at: index!)
            }
            else {
                locationManager.stopMonitoring(for: region)
            }
        }
        
        twentyNearbyRegions.forEach{
            createRegion(item: $0.0)
        }
    }
    
}

