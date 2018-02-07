//
//  GeographicAPPUITests.swift
//  GeographicAPPUITests
//
//  Created by ali adam on 2/7/18.
//  Copyright © 2018 Ali Adam. All rights reserved.
//

import XCTest

class GeographicAPPUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
    }
    
    
    // test Screens and Buttons 
    func testGoingThroughAPP() {
        app.launch()
        // testing open first page
        wait(for: 2)
        XCTAssertTrue(app.isDisplayingItemsTabBar)
        
        //test number of taps
        let collectionQuery = app.collectionViews
        let cellsCount = collectionQuery.cells.count
        XCTAssert(cellsCount == 2)
        
        
        // test number of cell on table
        var tablesQuery = app.tables
        let count = tablesQuery.cells.count
        XCTAssert(count > 0)
        
        
        // test opening map screen
        collectionQuery.cells.element(boundBy: 1).tap()
        wait(for: 1)
        XCTAssertTrue(app.isDisplayingItemsMap)
        
        
        
        // test open item List
        collectionQuery.cells.element(boundBy: 0).tap()
        wait(for: 1)
        XCTAssertTrue(app.isDisplayingItemList)
        
        
        // test open item details
        tablesQuery.cells.element(boundBy: 0).tap()
        wait(for: 1)
        XCTAssertTrue(app.isDisplayingItemDetails)
        
        
        // test going back to items list
        var navButtons = app.navigationBars.buttons
        XCTAssert(navButtons.count == 1)
        navButtons.element(boundBy: 0).tap()
        wait(for: 2)
        XCTAssertTrue(app.isDisplayingItemList)
        
        
        // handle call alert and cancel the call
        addUIInterruptionMonitor(withDescription: "Alert") { (alert) -> Bool in
            alert.buttons["Cancel"].tap()
            self.wait(for: 1)
            return true
        }
        addUIInterruptionMonitor(withDescription: "Error Occured") { (alert) -> Bool in
            alert.buttons["Cancel"].tap()
            return true
        }
        
        #if !((arch(i386) || arch(x86_64)) && os(iOS))
            /// test call phone  button
            let firstCell = tablesQuery.cells.element(boundBy: 0)
            firstCell.buttons.element(boundBy: 0).forceTapElement()
            wait(for: 1)
        #endif
        
        
        
        // test open url
        tablesQuery.cells.element(boundBy: 0).tap()
        wait(for: 1)
        XCTAssertTrue(app.isDisplayingItemDetails)
        tablesQuery = app.tables
        tablesQuery.cells.element(boundBy: tablesQuery.cells.count-2).tap()
        wait(for: 1)
        XCTAssertTrue(app.isDisplayingsafariView)
        navButtons = app.navigationBars.buttons
        XCTAssert(navButtons.count == 1)
        navButtons.element(boundBy: 0).tap()
        wait(for: 1)
        XCTAssertTrue(app.isDisplayingItemDetails)
        
        
        
        #if !((arch(i386) || arch(x86_64)) && os(iOS))
            // test send mail
            tablesQuery.cells.element(boundBy: tablesQuery.cells.count-4).tap()
            wait(for: 1)
            XCTAssertTrue(app.isDisplayingMailComposeView)
            navButtons = app.navigationBars.buttons
            XCTAssert(navButtons.count > 0)
            navButtons.element(boundBy: 0).tap()
            wait(for: 2)
            app.sheets.buttons.element(boundBy: 0).tap()
            wait(for: 1)
            XCTAssertTrue(app.isDisplayingItemDetails)
            
            // call phone item details
            tablesQuery.cells.element(boundBy: tablesQuery.cells.count-3).tap()
            wait(for: 1)
            
        #endif
        
        
    }
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
}


