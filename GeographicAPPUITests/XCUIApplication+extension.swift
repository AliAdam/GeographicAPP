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
        return otherElements["SplashView"].exists
    }
    var isDisplayingItemsTabBar: Bool {
        return otherElements["ItemsTabBar"].exists
    }
    var isDisplayingItemsMap: Bool {
        return otherElements["ItemMap"].exists
    }
    var isDisplayingItemList: Bool {
        return otherElements["ItemList"].exists
    }
    
    var isDisplayingItemDetails: Bool {
        return otherElements["ItemDetails"].exists
    }
    var isDisplayingsafariView: Bool {
        return otherElements["safariView"].exists
    }
    
    
    var isDisplayingMailComposeView: Bool {
        return otherElements["MailComposeView"].exists
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
