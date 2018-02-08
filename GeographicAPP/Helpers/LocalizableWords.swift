//
//  LocalizableWords().swift
//  GeographicAPP
//
//  Created by Ali Adam on 2/6/18.
//  Copyright © 2018 Ali Adam. All rights reserved.
//

import UIKit
// here you can find  constant messages and any other constant words on the App
struct LocalizableWords  {
    
    var englishCode = "en"
    var arabicCode = "ar"

    // alert button title
     var tryAgain = "Try Again".localized()
     var ok = "Okay".localized()
     var yes = "Yes".localized()
     var cancel = "Cancel".localized()
    /// error messages and titles
     var errorMessageTile = "Error Occured".localized()
     var parseErrorMessage = "Can Not Load And parse Please Try Again later".localized()
     var gpsErrorMessage =  "GPS access is restricted. In order to use Monitor Region, please enable Always GPS in the Settigs app under Privacy, Location Services.".localized()
     var goToSettingMessage =  "Go to Settings now".localized()
     var list = "List".localized()
     var map = "Map".localized()
     var WelcomeMessage =  "Welcome to".localized()
     var emailerrorMessage =  "Can not send email".localized()
     var phoneerrorMessage =  "Can not call phone".localized()
    
     var name = "Name".localized()
     var country = "Country".localized()
     var city = "City".localized()
     var email = "Email".localized()
     var phone = "Phone".localized()
     var location = "Location".localized()
     var url = "URL".localized()
     var type = "Type".localized()
     var locationsTilte = "locations".localized()
    
    
    
    
    struct AccessibilityIdentifier  {
        static let ItemsTabBar = "ItemsTabBar"
        static let ItemDetails = "ItemDetails"
        static let safariView = "safariView"
        static let MailComposeView = "MailComposeView"
        static let ItemMap = "ItemMap"
        static let ItemList = "ItemList"
        static let SplashView = "SplashView"
        
        
        
    }
    
    
    
}


