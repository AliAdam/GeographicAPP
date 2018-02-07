//
//  SplashViewModel.swift
//  GeographicAPP
//
//  Created by Ali Adam on 2/6/18.
//  Copyright (c) 2018 Ali Adam. All rights reserved.
//

import  Foundation
class ItemsListViewModel :NSObject{
    
    fileprivate var itemsList : [Item]?
    override init() {
        super.init()
    }
    
    // init the view model with list of item
    init(itemList:[Item]) {
        super.init()
        self.itemsList = itemList
    }
    
    var numberOfElement:Int {
        return (self.itemsList?.count)!
    }
    
    
    func itemAtIndex(index:Int) -> Item {
        return self.itemsList![index]
    }
    
}


