//
//  File.swift
//  GeographicAPPUITests
//
//  Created by ali adam on 2/7/18.
//  Copyright © 2018 Ali Adam. All rights reserved.
//

import XCTest

extension XCUIApplication {
    var isDisplayingSpalsh: Bool {
        return otherElements[AccessibilityIdentifier.SplashView].exists
    }
    var isDisplayingItemsTabBar: Bool {
        return otherElements[AccessibilityIdentifier.ItemsTabBar].exists
    }
    var isDisplayingItemsMap: Bool {
        return otherElements[AccessibilityIdentifier.ItemMap].exists
    }
    var isDisplayingItemList: Bool {
        return otherElements[AccessibilityIdentifier.ItemList].exists
    }
    
    var isDisplayingItemDetails: Bool {
        return otherElements[AccessibilityIdentifier.ItemDetails].exists
    }
    var isDisplayingsafariView: Bool {
        return otherElements[AccessibilityIdentifier.safariView].exists
    }
    
    
    var isDisplayingMailComposeView: Bool {
        return otherElements[AccessibilityIdentifier.MailComposeView].exists
    }

}

extension XCUIElement {
    func forceTapElement() {
        if self.isHittable {
            self.tap()
        }
        else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx:0.0, dy:0.0))
            coordinate.tap()
        }
    }
    
}

extension XCTestCase {
    
    func wait(for duration: TimeInterval) {
        let waitExpectation = expectation(description: "Waiting")
        
        let when = DispatchTime.now() + duration
        DispatchQueue.main.asyncAfter(deadline: when) {
            waitExpectation.fulfill()
        }
        waitForExpectations(timeout: duration + 0.5)
    }
}

struct AccessibilityIdentifier  {
    static let ItemsTabBar = "ItemsTabBar"
    static let ItemDetails = "ItemDetails"
    static let safariView = "safariView"
    static let MailComposeView = "MailComposeView"
    static let ItemMap = "ItemMap"
    static let ItemList = "ItemList"
    static let SplashView = "SplashView"
    
    
    
}
