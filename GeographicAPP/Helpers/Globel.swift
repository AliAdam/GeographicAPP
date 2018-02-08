//
//  Globel.swift
//  GeographicAPP
//
//  Created by Ali Adam on 2/8/18.
//  Copyright © 2018 Ali Adam. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

extension DefaultsKeys {
    static let isUserWasInDetailsScreen = DefaultsKey<Bool>("isUserWasInDetailsScreen")
    static let itemIndex = DefaultsKey<Int>("itemIndex")
}

class Globel {
    static let sharedInstance = Globel()
    
    func isUserWasInDetailsScreen() -> Bool {
        return Defaults[.isUserWasInDetailsScreen]
    }
    
    func getItemIndex() -> Int {
        return Defaults[.itemIndex]
    }
    func setUserWasInDetailsScreen(value:Bool) {
         Defaults[.isUserWasInDetailsScreen]  = value
    }
    
    func setItemIndex(value:Int) {
         Defaults[.itemIndex] = value
    }
    
    fileprivate init() { }
    
}

