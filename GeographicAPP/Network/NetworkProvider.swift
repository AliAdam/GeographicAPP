//
//  NetworkProvider.swift
//  GeographicAPP
//
//  Created by Ali Adam on 2/6/18.
//  Copyright © 2018 Ali Adam. All rights reserved.
//


import UIKit

/// shard singlton act like a network layer get and update the data
struct NetworkProvider {
    static let shared = NetworkProvider()
    
    private init() {
    }
    /// get list of items
    ///
    func itemList(completionHandler: @escaping (NetworkResponse<[Item]>) -> ()){
        guard  let data =  MockLoader.itemsListMock  else {
            completionHandler(.error(APPError.couldNotLoadMock))
            return
        }
        do{

            let decoder = JSONDecoder()
            let itemsList = try decoder.decode([Item].self, from: data)
            completionHandler(.success(itemsList))
        } catch {
            completionHandler(.error(APPError.couldNotParseJson))
        }
        
        
        
    }
 
}
