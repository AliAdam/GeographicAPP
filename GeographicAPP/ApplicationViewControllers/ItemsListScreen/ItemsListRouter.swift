//
//  SplashRouter.swift
//  GeographicAPP
//
//  Created by Ali Adam on 2/6/18.
//  Copyright (c) 2018 Ali Adam. All rights reserved.
//

import Foundation
import  UIKit
class ItemsListRouter:NSObject {
    
    weak var controller: UIViewController?
    
    override init() {
        super.init()
    }
    
    func showDetailsScreen(item:Item) {
        let nextController = StoryboardScene.ItemDetailsController.initialViewController()
        let viewModel = ItemDetailsViewModel(item: item)
        nextController.set(viewModel:viewModel)
        controller?.navigationController?.pushViewController(nextController, animated: true)
    }
}
