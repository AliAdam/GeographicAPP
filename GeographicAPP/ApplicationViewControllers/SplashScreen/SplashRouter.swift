//
//  SplashRouter.swift
//  GeographicAPP
//
//  Created by Ali Adam on 2/6/18.
//  Copyright (c) 2018 Ali Adam. All rights reserved.
//

import Foundation
import  UIKit
import XLPagerTabStrip
class SplashRouter:NSObject {
    
    weak var controller: SplashViewController?
    
    override init() {
        super.init()
    }
    // navigate to next screen collection screen
    func navigateToItemsListTab() {
        let itemsTabBarController = StoryboardScene.ItemsTabBarController.initialViewController()
        let itemsListController  = StoryboardScene.ItemsListController.initialViewController()
        let itemsMapController  = StoryboardScene.ItemsMapController.initialViewController()
        let itemsListViewModel = ItemsListViewModel(itemList:(controller?.getItemList())!)
        let itemsMapViewModel = ItemsMapViewModel(itemList:(controller?.getItemList())!)
        let itemsListIndicatorInfo = IndicatorInfo(title: LocalizableWords.list, image: UIImage(named: "list"))
        let itemsMapIndicatorInfo = IndicatorInfo(title: LocalizableWords.map, image: UIImage(named: "map"))
        itemsListController.set(itemInfo: itemsListIndicatorInfo, andViewModel: itemsListViewModel, andRouterController: itemsTabBarController)
        itemsMapController.set(itemInfo: itemsMapIndicatorInfo, andViewModel: itemsMapViewModel, andRouterController: itemsTabBarController)
        itemsTabBarController.setControllers(childControllers: [itemsListController,itemsMapController])
        
        controller?.navigationController?.setViewControllers([itemsTabBarController], animated: true)
    }
    // show alert controller
    func showParsingErrorAlert() {
        AlertControllerHelper.showAlert(withTitle: LocalizableWords.errorMessageTile, message: LocalizableWords.parseErrorMessage, on: controller!)
    }
}
