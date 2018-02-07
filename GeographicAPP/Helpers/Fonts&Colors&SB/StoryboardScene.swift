//
//  StoryboardScene.swift
//  GeographicAPP
//
//  Created by Ali Adam on 2/6/18.
//  Copyright © 2018 Ali Adam. All rights reserved.
//

import Foundation
import UIKit

// this to mange all screen it helpful when you have more than one storyboard
//
protocol StoryboardSceneType {
    static var storyboardName: String { get }
}

extension StoryboardSceneType {
    /// load storyboard by it's name
    ///
    /// - Returns: storyboarf loaded
    static func storyboard() -> UIStoryboard {
        return UIStoryboard(name: self.storyboardName, bundle: nil)
    }
    
    
    /// load storyboard first Controller
    static func initialViewController() -> UIViewController {
        guard let vc = storyboard().instantiateInitialViewController() else {
            fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
        }
        return vc
    }
    /// load view Controller with idebtifier
    ///
    /// - Parameter withIdentifier: Controller identifier
    /// - Returns: Controller
    static func viewController(withIdentifier:String) -> UIViewController {
        return Self.storyboard().instantiateViewController(withIdentifier:withIdentifier)
    }
}

/// enum contain refrence of all screens on the app
enum StoryboardScene {
    enum SplashController: StoryboardSceneType {
        static let storyboardName = "Main"
        static let viewController = "SplashViewController"
        static func initialViewController() -> SplashViewController {
            return  viewController(withIdentifier: viewController) as! SplashViewController
        }
    }
    
    enum ItemsListController: StoryboardSceneType {
        static let storyboardName = "Main"
        static let viewController = "ItemsListViewController"
        static func initialViewController() -> ItemsListViewController {
            return  viewController(withIdentifier: viewController) as! ItemsListViewController
        }
    }
    
    enum ItemsMapController: StoryboardSceneType {
        static let storyboardName = "Main"
        static let viewController = "ItemsMapViewController"
        static func initialViewController() -> ItemsMapViewController {
            return  viewController(withIdentifier: viewController) as! ItemsMapViewController
        }
    }
    
    enum ItemDetailsController: StoryboardSceneType {
        static let storyboardName = "Main"
        static let viewController = "ItemDetailsViewController"
        static func initialViewController() -> ItemDetailsViewController {
            return  viewController(withIdentifier: viewController) as! ItemDetailsViewController
        }
    }
    
    enum ItemsTabBarController: StoryboardSceneType {
        static let storyboardName = "Main"
        static let viewController = "ItemsTabBarViewController"
        static func initialViewController() -> ItemsTabBarViewController {
            return  viewController(withIdentifier: viewController) as! ItemsTabBarViewController
        }
    }
}
