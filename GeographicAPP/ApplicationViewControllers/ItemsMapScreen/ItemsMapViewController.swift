//
//  ItemsMapViewController.swift
//  GeographicAPP
//
//  Created by Ali Adam on 2/6/18.
//  Copyright (c) 2018 Ali Adam. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import MapKit

class ItemsMapViewController: UIViewController,IndicatorInfoProvider  {
    // controller view model
    @IBOutlet var viewModel: ItemsMapViewModel!
    var itemInfo: IndicatorInfo = "Map"
    // contrroler router to navigate to other controller or show messages
    @IBOutlet var router: ItemsMapRouter!

    @IBOutlet weak var mapView: MKMapView!
    
    func set(itemInfo: IndicatorInfo,andViewModel viewModel:ItemsMapViewModel, andRouterController routerController: UIViewController) {
        self.itemInfo = itemInfo
        self.viewModel = viewModel
        router.controller = routerController
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        addPinToMap()
        MKAnnotationView.swizzlingMKAnnotationView
        view.accessibilityIdentifier = "ItemMap"
        
    }
    func addPinToMap()  {
        for i in 0..<self.viewModel.numberOfElement {
            let location = self.viewModel.locationForItemAtIndex(index:i)
            self.zoomToLocation(location: location,index: i)
            
        }
        
        mapView.showAnnotations(self.mapView.annotations, animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
    func zoomToLocation(location:CLLocationCoordinate2D ,index : Int) {
        let dropPin = MKPointAnnotation()
        dropPin.title = "\(index)"
        dropPin.coordinate = location
        mapView!.addAnnotation(dropPin)
    }
    
    // MARK: - IndicatorInfoProvider
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
extension ItemsMapViewController: MKMapViewDelegate
{

    func mapView(_ mapView: MKMapView,
                 didSelect view: MKAnnotationView)
    {
        
        if view.annotation is MKUserLocation
        {
            // Don't proceed with custom callout
            return
        }
        let views = Bundle.main.loadNibNamed("ItemCell", owner: nil, options: nil)
        let calloutView = views?[0] as! ItemCell
        let index = (view.annotation!.title! as! NSString ).integerValue
        let item =  self.viewModel.itemAtIndex(index: index)
        calloutView.configureWith(item: item)
        calloutView.tag = index
        calloutView.cellTapHandler  = {[weak self ] cell in
            self?.userClickItem(atIndex: cell.tag)
        }
        calloutView.center = CGPoint(x: view.bounds.size.width / 2, y: -calloutView.bounds.size.height*0.52)
        view.addSubview(calloutView)
        view.isUserInteractionEnabled = true
        mapView.setCenter((view.annotation?.coordinate)!, animated: true)
    
    }
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
            for subview in view.subviews
            {
                if subview.isKind(of: ItemCell.self)
                {
                subview.removeFromSuperview()
                }
            }
    }
    
    func userClickItem(atIndex :Int) {
        print("\(atIndex) ")
        let item = self.viewModel.itemAtIndex(index:atIndex)
        
        router.showDetailsScreen(item:item)
    }
}


