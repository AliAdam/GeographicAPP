//
//  SplashViewController.swift
//  GeographicAPP
//
//  Created by Ali Adam on 2/6/18.
//  Copyright (c) 2018 Ali Adam. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController  {
    // controller view model
    @IBOutlet var viewModel: SplashViewModel!
    
    // contrroler router to navigate to other controller or show messages
    @IBOutlet var router: SplashRouter!
    @IBOutlet weak var animatedView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set the router controller
        startAnimatedView()
        router.controller = self
        self.navigationController?.isNavigationBarHidden = true
        view.accessibilityIdentifier = LocalizableWords.AccessibilityIdentifier.SplashView
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // load items list
        self.loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    /// load item list and navigate to collection view on sucess
    // show error on fail
    func loadData()  {
        viewModel.loadItemsList { [weak self] response in
            switch response {
            case .success(_):
                self?.router.navigateToItemsListTab()
                
            case .error( _):
                self?.router.showParsingErrorAlert()
            }
        }
    }
    
    // add simple pulse animation to the view 
    func startAnimatedView(){
        self.animatedView.backgroundColor = Colors.brandColor
        self.animatedView.alpha = 0.4
        self.animatedView.layer.cornerRadius = self.animatedView.frame.size.width/2
        animateView()
        
    }
    
    func animateView(){
        UIView.animate(withDuration: 2.0, animations: {
            self.animatedView.alpha = 0.2
            self.animatedView.transform = CGAffineTransform(scaleX: 100, y: 100)
        }) { success in
            self.animatedView.transform = .identity
            self.animateView()
        }
    }
    
    
    /// get item list to pass it to the new viewmodel of next screen
    func getItemList() -> [Item] {
        return viewModel.getItemList()
    }
}
