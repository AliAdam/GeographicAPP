//
//  SplashViewModel.swift
//  GeographicAPP
//
//  Created by Ali Adam on 2/6/18.
//  Copyright (c) 2018 Ali Adam. All rights reserved.
//

import  Foundation
class SplashViewModel :NSObject{
    
    fileprivate var itemsList : [Item]?
    override init() {
        super.init()
    }
    // load item list
    func loadItemsList(completionHandler: @escaping (NetworkResponse<Bool>) -> ()){
        NetworkProvider.shared.itemList { [weak self] response in
            switch response {
            case let .success(itemList):
                self?.itemsList = itemList
                self?.monitorRegions()
                completionHandler(.success(true))
                print("items count = \(String(describing: itemList.count))")
            case let .error(error):
                completionHandler(.error(error))
                print("\(error.localizedDescription)")
            }
        }
        
    }
    
    func monitorRegions() {
        LocationService.default.monitorRegions(items: (self.itemsList)!)
        
    }
    var itemsCount :Int {
        return (self.itemsList?.count)!
    }
    /// get item list
    func getItemList() -> [Item] {
        return itemsList!
    }
    
    
}


