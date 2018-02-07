//
//  ItemDetailsViewModelTest.swift
//  GeographicAPPTests
//
//  Created by ali adam on 2/7/18.
//  Copyright © 2018 Ali Adam. All rights reserved.
//

import XCTest
@testable import GeographicAPP

class ItemDetailsViewModelTest: XCTestCase {
    let item = MockData.items.first!
    var viewModel : ItemDetailsViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = ItemDetailsViewModel(item: item)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testItemDetailsViewModel() {
        
        XCTAssertEqual(viewModel.itemName, item.name!, "itemName should not mutate data ")
        XCTAssertEqual(viewModel.countryName, item.country!, "countryName should not mutate data ")
        XCTAssertEqual(viewModel.cityName, item.city!, "cityName should not mutate data ")
        XCTAssertEqual(viewModel.email, item.email!, "email should not mutate data ")
        XCTAssertEqual(viewModel.phone, item.phone!, "phone should not mutate data ")
        XCTAssertEqual(viewModel.location.coordinate.latitude, item.latitude!, "location should not mutate data ")
        XCTAssertEqual(viewModel.location.coordinate.longitude, item.longitude!, "location should not mutate data ")
        XCTAssertEqual(viewModel.url.absoluteString, item.url, "url should not mutate data ")
        
        
        
        
        
        
    }
    
}
