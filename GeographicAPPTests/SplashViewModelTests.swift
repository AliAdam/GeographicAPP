//
//  GeographicAPPTests.swift
//  GeographicAPPTests
//
//  Created by Ali Adam on 2/6/18.
//  Copyright © 2018 Ali Adam. All rights reserved.
//

import XCTest
@testable import GeographicAPP

class SplashViewModelTests: XCTestCase {
    var spViewModel : SplashViewModel!
    override func setUp() {
        super.setUp()
       spViewModel =  SplashViewModel()
        spViewModel.loadItemsList { (respnse) in
            
        }
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSPViewModel() {
        XCTAssertEqual(spViewModel.getItemList().count, 10, "returned items  should be equal to items on the mock up fils ")
        XCTAssertEqual(spViewModel.getItemList().count, spViewModel.itemsCount, "items  count  should be equal to number of items on the list")
    }
    
}
