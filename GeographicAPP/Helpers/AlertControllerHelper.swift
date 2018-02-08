//
//  AlertControllerHelper.swift
//  GeographicAPP
//
//  Created by Ali Adam on 2/6/18.
//  Copyright © 2018 Ali Adam. All rights reserved.
//

import UIKit

final class AlertControllerHelper {
    
    private init() {}
    // show quick alert with title and message and okay button 
    static func showAlert(withTitle title: String, message: String?, on viewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: LocalizableWords().ok, style: .default))
        viewController.present(alertController, animated: true)
    }
    
    static func showPhoneErroralertController() {
        let alert = UIAlertController(title: LocalizableWords().errorMessageTile, message:LocalizableWords().phoneerrorMessage , preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: LocalizableWords().ok, style: UIAlertActionStyle.default, handler: { (alert: UIAlertAction!) in
            print("")
        }))
        DispatchQueue.main.async(execute: {
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
            
        })
        
    }
    
    
    
    
}
