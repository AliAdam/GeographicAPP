//
//  SplashRouter.swift
//  GeographicAPP
//
//  Created by Ali Adam on 2/6/18.
//  Copyright (c) 2018 Ali Adam. All rights reserved.
//

import Foundation
import  UIKit
class ItemDetailsRouter:NSObject {
    
    weak var controller: ItemDetailsViewController?
    
    override init() {
        super.init()
    }
    
    // show alert controller
    func showEmailErrorAlert() {
        AlertControllerHelper.showAlert(withTitle: LocalizableWords.errorMessageTile, message: LocalizableWords.emailerrorMessage, on: controller!)
    }

}
