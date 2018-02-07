
//
//  Items.swift
//  GeographicAPP
//
//  Created by Ali Adam on 2/6/18.
//  Copyright © 2018 Ali Adam. All rights reserved.
//


import Foundation
import CoreLocation
/// item list model contain list of items
struct Item : Codable {
    let locationID : Int?
    let latitude : Double?
    let longitude : Double?
    let name : String?
    let city : String?
    let country : String?
    let phone : String?
    let type : String?
    let email : String?
    let url : String?
    let location : CLLocationCoordinate2D?
    
    enum CodingKeys: String, CodingKey {
        
        case locationID = "locationID"
        case latitude = "latitude"
        case longitude = "longitude"
        case name = "name"
        case city = "city"
        case country = "country"
        case phone = "phone"
        case type = "type"
        case email = "email"
        case url = "url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        locationID = (try values.decodeIfPresent(String.self, forKey: .locationID)! as NSString).integerValue
        latitude = (try values.decodeIfPresent(String.self, forKey: .latitude)! as NSString).doubleValue
        longitude = (try values.decodeIfPresent(String.self, forKey: .longitude)! as NSString).doubleValue
        location = CLLocationCoordinate2DMake(latitude!,longitude!)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }
    
    
    //Init for testing / Mock Data
    
    init(locationID : Int , latitude : Double , longitude : Double , name : String , city : String , country : String , phone : String , type : String , email : String , url : String){
        
        self.locationID  = locationID
        self.latitude  = latitude
        self.longitude  = longitude
        location = CLLocationCoordinate2DMake(latitude,longitude)
        
        self.name  = name
        self.city  = city
        self.country  = country
        self.phone = phone
        self.type = type
        self.email  = email
        self.url  = url
    }
}
