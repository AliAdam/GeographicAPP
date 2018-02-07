//
//  ItemDetailsViewControllerTest.swift
//  GeographicAPPTests
//
//  Created by ali adam on 2/7/18.
//  Copyright © 2018 Ali Adam. All rights reserved.
//

import XCTest
@testable import GeographicAPP
 import CoreLocation
class ItemDetailsViewControllerTest: XCTestCase {
    let item = MockData.items.first!
    var viewModel : ItemDetailsViewModel!
    var detailVC: ItemDetailsViewController!
    override func setUp() {
        super.setUp()
        viewModel = ItemDetailsViewModel(item: item)
        self.detailVC = StoryboardScene.ItemDetailsController.initialViewController()
        self.detailVC.set(viewModel:viewModel)
        let _ = self.detailVC?.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testdetailsText() {
    let valuesDictionary = self.detailVC.form.values()
        XCTAssertTrue((valuesDictionary[LocalizableWords.name] as! String) == self.viewModel.itemName, "name title should hold item name" )
        XCTAssertTrue((valuesDictionary[LocalizableWords.country] as! String) == self.viewModel.countryName, "country title should hold item name" )
        XCTAssertTrue((valuesDictionary[LocalizableWords.city] as! String) == self.viewModel.cityName, "city title should hold item name" )
        XCTAssertTrue((valuesDictionary[LocalizableWords.email] as! String) == self.viewModel.email, "email title should hold item name" )
        XCTAssertTrue((valuesDictionary[LocalizableWords.phone] as! String) == self.viewModel.phone, "phone title should hold item name" )
        XCTAssertTrue((valuesDictionary[LocalizableWords.url] as! URL) == self.viewModel.url, "url title should hold item name" )
        XCTAssertTrue((valuesDictionary[LocalizableWords.location] as! CLLocation ).coordinate.longitude == self.viewModel.location.coordinate.longitude, "location title should hold item name" )
         XCTAssertTrue((valuesDictionary[LocalizableWords.location] as! CLLocation ).coordinate.latitude == self.viewModel.location.coordinate.latitude, "location title should hold item name" )
     
    }
   
    
}
