//
//  MockData.swift
//  GeographicAPP
//
//  Created by Ali Adam on 2/7/18.
//  Copyright © 2018 Ali Adam. All rights reserved.
//

import UIKit
import Foundation

// this is just mock data for unit testing 
struct MockData {
    public static let items: [Item] = [
        Item.init(locationID: 1, latitude: 2.0, longitude: 2.0, name: "name1", city: "city1", country: "country1", phone: "1234674", type: "Services", email: "email1@email.com", url: "www.url3.com"),
        Item.init(locationID: 2, latitude: 3.0, longitude: 4.0, name: "name2", city: "city2", country: "country5", phone: "1234564", type: "Services", email: "email13@email.com", url: "www.url2.com"),
        Item.init(locationID: 3, latitude: 4.0, longitude: 3.0, name: "name3", city: "city3", country: "country4", phone: "1234434", type: "Services", email: "email12@email.com", url: "www.url1.com")
    ]
}
