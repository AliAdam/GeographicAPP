//
//  NetworkResponse.swift
//  GeographicAPP
//
//  Created by Ali Adam on 2/6/18.
//  Copyright © 2018 Ali Adam. All rights reserved.
//


/// respnse enumration
///
/// - error: in case error occure pass the error
/// - success: in success case pass the object to it
enum NetworkResponse<Element> {
    case error(Error)
    case success(Element)
    
}

