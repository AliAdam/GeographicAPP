//
//  ItemsListViewModelTest.swift
//  GeographicAPPTests
//
//  Created by ali adam on 2/7/18.
//  Copyright © 2018 Ali Adam. All rights reserved.
//

import XCTest
@testable import GeographicAPP

class ItemsViewModelTest: XCTestCase {
    let items = MockData.items
    var iTViewModel : ItemsListViewModel!
    var iMViewModel : ItemsMapViewModel!
    override func setUp() {
        super.setUp()
        iTViewModel = ItemsListViewModel(itemList: items)
        iMViewModel = ItemsMapViewModel(itemList: items)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testITViewModel() {
        XCTAssertEqual(iTViewModel.numberOfElement, items.count, "items  count  should be equal to number of items passed to it ")
        XCTAssertEqual(iTViewModel.itemAtIndex(index: 0).locationID!, items.first?.locationID!, "item returned should be equal to the paased item")
        XCTAssertEqual(iTViewModel.itemAtIndex(index: 0).location?.latitude, items.first?.latitude!, "item location lat should equal item lat")
        XCTAssertEqual(iTViewModel.itemAtIndex(index: 0).location?.longitude, items.first?.longitude!, "item location lon should equal item lon")
        
    }
    
    func testIMViewModel() {
        XCTAssertEqual(iMViewModel.numberOfElement, items.count, "items  count  should be equal to number of items passed to it ")
        XCTAssertEqual(iMViewModel.itemAtIndex(index: 0).locationID!, items.first?.locationID!, "item returned should be equal to the paased item")
        XCTAssertEqual(iMViewModel.itemAtIndex(index: 0).location?.latitude, items.first?.latitude!, "item location lat should equal item lat")
        XCTAssertEqual(iMViewModel.itemAtIndex(index: 0).location?.longitude, items.first?.longitude!, "item location lon should equal item lon")
        
    }
    
    func testIMViewModelAndITViewModel() {
        XCTAssertEqual(iMViewModel.numberOfElement, iTViewModel.numberOfElement, "ItemsListViewModel and  ItemsMapViewModel  should return same Data")
        XCTAssertEqual(iMViewModel.itemAtIndex(index: 0).locationID!, iTViewModel.itemAtIndex(index: 0).locationID!, "ItemsListViewModel and  ItemsMapViewModel  should return same Data")
        XCTAssertEqual(iMViewModel.itemAtIndex(index: 0).location?.latitude,iTViewModel.itemAtIndex(index: 0).location?.latitude, "ItemsListViewModel and  ItemsMapViewModel  should return same Data")
        XCTAssertEqual(iMViewModel.itemAtIndex(index: 0).location?.longitude,iTViewModel.itemAtIndex(index: 0).location?.longitude, "ItemsListViewModel and  ItemsMapViewModel  should return same Data")
        
    }
    
}
