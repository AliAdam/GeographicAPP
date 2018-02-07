//
//  SplashViewModel.swift
//  GeographicAPP
//
//  Created by Ali Adam on 2/6/18.
//  Copyright (c) 2018 Ali Adam. All rights reserved.
//

import  Foundation
import  CoreLocation
class ItemDetailsViewModel :NSObject{
    
    fileprivate var item : Item?
    override init() {
        super.init()
    }
    
    init(item:Item) {
        super.init()
        self.item = item
    }
    
    var itemName:String {
        return self.item?.name ?? ""
    }
    
    var countryName:String {
        return self.item?.country ?? ""
    }
    
    var cityName:String {
        return self.item?.city ?? ""
    }
    var phone:String {
        return self.item?.phone ?? ""
    }
    
    var type:String {
        return self.item?.type ?? ""
    }
    
    var email:String {
        return self.item?.email ?? ""
    }
    var url:URL {
        return URL(string:self.item?.url ?? "")!
    }
    
    var location :CLLocation {
        return CLLocation(latitude: (self.item?.latitude)!, longitude: (self.item?.longitude)!)
    }
    
}


