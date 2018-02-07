//
//  ExtensionString.swift
//  GeographicAPP
//
//  Created by ali adam on 2/7/18.
//  Copyright © 2018 Ali Adam. All rights reserved.
//

import Foundation
import UIKit
extension String {
    func call()->Bool {
        let cleanPhoneNumber = self
        if let url = URL(string: "telprompt://\(cleanPhoneNumber)"), UIApplication.shared.canOpenURL(url)
        {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            return true
        }
        return false
    }
}
