//
//  ItemCell.swift
//  GeographicAPP
//
//  Created by Ali Adam on 2/6/18.
//  Copyright © 2018 Ali Adam. All rights reserved.
//

import UIKit
import MapKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    var cellTapHandler: (_ cell:ItemCell) -> Void = {_ in  }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 10
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        nameLabel.font = FontManager.APPMedium.fontWith(size:16)
        countryLabel.font = FontManager.APPRegular.fontWith(size:15)
        cityLabel.font = FontManager.APPLight.fontWith(size:15)
        phoneLabel.font = FontManager.APPBold.fontWith(size:15)
        nameLabel.textColor = Colors.brandColor.withAlphaComponent(0.8)
        countryLabel.textColor = Colors.accentBrown.withAlphaComponent(0.8)
        cityLabel.textColor = Colors.brandGray.withAlphaComponent(0.8)
        phoneLabel.textColor = Colors.accentYellow.withAlphaComponent(0.8)
        
    }
    
    func configureWith(item:Item) {
        
        self.nameLabel.text = item.name ?? ""
        self.countryLabel.text = item.country ?? ""
        self.cityLabel.text = item.city ?? ""
        self.phoneLabel.text = item.phone ?? ""
        self.zoomToLocation(location: item.location!)
        
        
        
        
    }
    open class func height() -> CGFloat {
        return 145
    }
    
    open class func cellIdentifier() -> String {
        return "ItemCell"
    }
    
    // MARK - Action Handler
    @IBAction func callPhoneNumber(_ sender: Any) {
        let res =  phoneLabel.text!.call()
        if !res {
            AlertControllerHelper.showPhoneErroralertController()
        }
    }
    
    
    func zoomToLocation(location:CLLocationCoordinate2D) {
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = location
        mapView!.addAnnotation(dropPin)
        self.mapView?.setRegion(MKCoordinateRegionMakeWithDistance(location, 100, 100), animated: true)
    }
    @IBAction func tapCellBTN(_ sender: Any) {
        self.cellTapHandler(self)
    }
    
}
