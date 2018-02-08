//
//  SplashViewController.swift
//  GeographicAPP
//
//  Created by Ali Adam on 2/6/18.
//  Copyright (c) 2018 Ali Adam. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class ItemsListViewController: UIViewController,IndicatorInfoProvider  {
    // controller view model
    @IBOutlet var viewModel: ItemsListViewModel!
    
    // contrroler router to navigate to other controller or show messages
    @IBOutlet var router: ItemsListRouter!
    
    @IBOutlet weak var tableView: UITableView!
    
    // this var hold tap item info title and image 
    var itemInfo: IndicatorInfo = "List"
    
    
    // set viewModel and router and itemIinfo
    func set(itemInfo: IndicatorInfo,andViewModel viewModel:ItemsListViewModel, andRouterController routerController: UIViewController) {
        self.itemInfo = itemInfo
        self.viewModel = viewModel
        router.controller = routerController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        view.accessibilityIdentifier = LocalizableWords.AccessibilityIdentifier.ItemList
    }
    
    // register nib and set register
    func setTableView()  {
        tableView.register(ItemCell.self, forCellReuseIdentifier: ItemCell.cellIdentifier())
        tableView.register(UINib(nibName: ItemCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: ItemCell.cellIdentifier())
        tableView.backgroundColor = Colors.brandGray
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    // MARK: - IndicatorInfoProvider
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
    
    /// go to item details if user change language from it
    
}


// MARK: - UITableViewDelegate

extension ItemsListViewController: UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel.numberOfElement
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ItemCell.height()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.cellIdentifier())! as! ItemCell
        let item = self.viewModel.itemAtIndex(index:indexPath.item)
        
        // configure cell With its item 
        cell.configureWith(item: item)
        
        cell.cellTapHandler  = {[weak self ] cell in
            let index =  self?.tableView.indexPath(for: cell)
            self?.userClickItem(atIndex: (index?.item)!)
        }
        return cell
    }
    
    
    // user click on cell  to go to details page
    func userClickItem(atIndex :Int) {
        print("\(atIndex) ")
        Globel.sharedInstance.setItemIndex(value: atIndex)
        let item = self.viewModel.itemAtIndex(index:atIndex)
        router.showDetailsScreen(item:item)
    }
}
