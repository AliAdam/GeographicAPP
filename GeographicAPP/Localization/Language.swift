//
//  Language.swift
//  GeographicAPP
//
//  Created by Ali Adam on 2/8/18.
//  Copyright © 2016 Ali Adam. All rights reserved.
//

import UIKit

// constants
let APPLE_LANGUAGE_KEY = "AppleLanguages"
class Language {
    /// get current Apple language
    class func currentAppleLanguage() -> String{
        let userdef = UserDefaults.standard
        let langArray = userdef.object(forKey: APPLE_LANGUAGE_KEY) as! NSArray
        let current = langArray.firstObject as! String
        let endIndex = current.startIndex
        let index = current.index(endIndex, offsetBy: 2)
        let currentWithoutLocale = String(current[..<index])
        return currentWithoutLocale
    }
    
    class func currentAppleLanguageFull() -> String{
        let userdef = UserDefaults.standard
        let langArray = userdef.object(forKey: APPLE_LANGUAGE_KEY) as! NSArray
        let current = langArray.firstObject as! String
        return current
    }
    
    /// set @lang to be the first in Applelanguages list
    class func setAppleLAnguageTo(lang: String) {
        let userdef = UserDefaults.standard
        userdef.set([lang], forKey: APPLE_LANGUAGE_KEY)
        userdef.synchronize()
    }

    class var isRTL: Bool {
        return Language.currentAppleLanguage() == "ar"
    }
}
