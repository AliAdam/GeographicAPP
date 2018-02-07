//
//  AppDelegate.swift
//  GeographicAPP
//
//  Created by Ali Adam on 2/6/18.
//  Copyright © 2018 Ali Adam. All rights reserved.
//

import UIKit
import UserNotifications
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let locationService = LocationService.default
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        setAppearance()
        SetUpNotificationCenter()
        
        if CommandLine.arguments.contains("--uitesting") {
            resetState()
        }
        return true
    }
    
    func SetUpNotificationCenter() {
        
        UIApplication.shared.applicationIconBadgeNumber = 0
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound,.badge]) { (granted, error) in
        }
        
    }
    func setAppearance() {
        UINavigationBar.appearance().barTintColor = Colors.brandColor
        UINavigationBar.appearance().tintColor = Colors.whiteColor
        UIApplication.shared.statusBarStyle = .lightContent
        
    }
    
    func resetState() {
        let defaultsName = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: defaultsName)
    }
    func applicationWillResignActive(_ application: UIApplication) {}
    
    func applicationDidEnterBackground(_ application: UIApplication) {}
    
    func applicationWillEnterForeground(_ application: UIApplication) {}
    
    func applicationDidBecomeActive(_ application: UIApplication) {}
    
    func applicationWillTerminate(_ application: UIApplication) {}
    
    
}

