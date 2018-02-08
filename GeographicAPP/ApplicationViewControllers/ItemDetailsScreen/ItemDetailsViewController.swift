//
//  ItemDetailsViewController.swift
//  GeographicAPP
//
//  Created by Ali Adam on 2/6/18.
//  Copyright (c) 2018 Ali Adam. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Eureka
import MapKit
import MessageUI
import SafariServices

class ItemDetailsViewController: FormViewController {
    // controller view model
    @IBOutlet var viewModel: ItemDetailsViewModel!
    
    // contrroler router to navigate to other controller or show messages
    @IBOutlet var router: ItemDetailsRouter!
    func set( viewModel:ItemDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set the router controller
        router.controller = self
        view.accessibilityIdentifier = LocalizableWords.AccessibilityIdentifier.ItemDetails
        setUpForm()
    }
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpNavigation()
        
    }
    
    // create a form  to show details on it
    func setUpForm()  {
        
        URLRow.defaultCellUpdate = { cell, row in
            cell.textField.textColor = Colors.brandColor
            cell.textLabel?.textColor = Colors.brandColor
            cell.textField.font = FontManager.APPRegular.fontWith(size:17)
            cell.textLabel?.font = FontManager.APPLight.fontWith(size:20)
            cell.isEditing = false
             cell.textField.tag = -1
            
            
        }
        LabelRow.defaultCellUpdate = { cell, row in
            cell.detailTextLabel?.textColor = Colors.brandGray
            cell.textLabel?.textColor = Colors.brandColor
            cell.detailTextLabel?.font = FontManager.APPRegular.fontWith(size:17)
            cell.textLabel?.font = FontManager.APPLight.fontWith(size:20)
            cell.isEditing = false
            
            
        }
    
        
        LocationRow.defaultCellUpdate = { cell, row in
            cell.detailTextLabel?.textColor = Colors.brandGray
            cell.textLabel?.textColor = Colors.brandColor
            cell.detailTextLabel?.font = FontManager.APPRegular.fontWith(size:17)
            cell.textLabel?.font = FontManager.APPLight.fontWith(size:20)
            cell.isEditing = false
        }
        
        form +++
            
            Section()
            
            <<< LabelRow (LocalizableWords().name) {
                $0.title = LocalizableWords().name
                $0.value = self.viewModel.itemName
            }
            <<< LabelRow (LocalizableWords().country) {
                $0.title = LocalizableWords().country
                $0.value = self.viewModel.countryName
            }
            <<< LabelRow (LocalizableWords().city) {
                $0.title = LocalizableWords().city
                $0.value = self.viewModel.cityName
            }
            
            <<< LabelRow (LocalizableWords().type) {
                $0.title = LocalizableWords().type
                $0.value = self.viewModel.type
            }
            
            <<< LabelRow (LocalizableWords().email) {
                $0.title = LocalizableWords().email
                $0.value = self.viewModel.email
                $0.disabled = true
                
                }
                .onCellSelection({ (cell, row) in
                    self.sendEmail(email: row.value!)
                })
            
            <<< LabelRow (LocalizableWords().phone) {
                $0.title = LocalizableWords().phone
                $0.value = self.viewModel.phone
                $0.disabled = true
                }
                .onCellSelection({ (cell, row) in
                    print("\(row.value ?? "")")
                    let res =  "\(row.value ?? "")".call()
                    if !res {
                        AlertControllerHelper.showPhoneErroralertController()
                    }
                    
                })
            <<< URLRow(LocalizableWords().url) {
                $0.title = LocalizableWords().url
                $0.value = self.viewModel.url
                $0.disabled = true
                
                }
                .onCellSelection({ (cell, row) in
                    self.openUrl(url: row.value!)
                })
            
            <<< LocationRow(LocalizableWords().location){
                $0.title = LocalizableWords().location
                $0.value = self.viewModel.location
        }
    }

    
    @IBAction func switchLangAction(_ sender: Any) {
        Globel.sharedInstance.setUserWasInDetailsScreen(value: true)
        Localizer.switchTheLanguage()
        
    }
    func setUpNavigation()  {
        self.title =  self.viewModel.itemName
        let textAttributes:[NSAttributedStringKey:Any]? = [NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue):Colors.whiteColor, NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue):FontManager.APPLight.fontWith(size: 17)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
}



extension ItemDetailsViewController: MFMailComposeViewControllerDelegate {
    
    func openUrl(url:URL){
        //  will open the url inside app with in  SFSafariViewController
        // this is not the best soulution for sure i just use it on the task for it's simpelicity
        let vc = SFSafariViewController(url: url)
        vc.view.accessibilityIdentifier = LocalizableWords.AccessibilityIdentifier.safariView
        self.navigationController?.show(vc, sender: self)
    }
    
    func sendEmail(email:String) {
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            router.showEmailErrorAlert()
            return
        }
        let composeVC = MFMailComposeViewController()
        composeVC.view.accessibilityIdentifier = LocalizableWords.AccessibilityIdentifier.MailComposeView
        composeVC.mailComposeDelegate = self
        composeVC.setToRecipients([email])
        composeVC.setSubject("FeedBack")
        composeVC.setMessageBody("FeedBack", isHTML: false)
        self.present(composeVC, animated: true, completion: nil)
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}

