

import Foundation
import XLPagerTabStrip

/// controller that hold item list and map screen
class ItemsTabBarViewController: BaseButtonBarPagerTabStripViewController <HomeTabCell> {
    
    // array of viewController will appear on the tab controller 
    private var childControllers : [UIViewController]!
    
    func setControllers(childControllers:[UIViewController])  {
        self.childControllers = childControllers
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // load tab cell nib file
        buttonBarItemSpec = ButtonBarItemSpec.nibFile(nibName: HomeTabCell.cellIdentifier(), bundle: Bundle(for: HomeTabCell.self), width: { _ in
            return (UIScreen.main.bounds.width / 2) - 40
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.setUpTap()
        view.accessibilityIdentifier = LocalizableWords.AccessibilityIdentifier.ItemsTabBar
    }
    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
        setUpNavigation()
    }
    
    
    func setUpNavigation()  {
        self.title = LocalizableWords().locationsTilte
        let textAttributes:[NSAttributedStringKey:Any]? = [NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue):Colors.whiteColor, NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue):FontManager.APPLight.fontWith(size: 25)]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return Array(self.childControllers)
    }
    
    // confgure tap cell
    override func configure(cell: HomeTabCell, for indicatorInfo: IndicatorInfo) {
        cell.iconImage.image = indicatorInfo.image?.withRenderingMode(.alwaysTemplate)
        cell.titleLab.text = indicatorInfo.title
        cell.titleLab.font = FontManager.APPLight.fontWith(size: 13)
        cell.iconImage.tintColor = Colors.brandGray//.withAlphaComponent(0.8)
        cell.titleLab.textColor = Colors.brandGray//.withAlphaComponent(0.8)
        
        
    }
    
    // setup tap bar apperance
    func setUpTap() {
        self.containerView.backgroundColor = Colors.brandGray
        settings.style.buttonBarBackgroundColor = Colors.whiteColor
        settings.style.buttonBarItemBackgroundColor = Colors.whiteColor
        settings.style.selectedBarBackgroundColor = Colors.whiteColor
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        buttonBarView.selectedBar.backgroundColor = Colors.brandColor
        buttonBarView.backgroundColor = Colors.whiteColor
        changeCurrentIndexProgressive = {  (oldCell: HomeTabCell?, newCell: HomeTabCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.iconImage.tintColor = Colors.brandGray
            oldCell?.titleLab.textColor = Colors.brandGray
            newCell?.iconImage.tintColor = Colors.blackColor
            newCell?.titleLab.textColor = Colors.blackColor
        }
        
    }

    @IBAction func switchLangAction(_ sender: Any) {
        Localizer.switchTheLanguage()
    }
    
}
