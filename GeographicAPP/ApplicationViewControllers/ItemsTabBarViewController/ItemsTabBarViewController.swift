

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
        buttonBarItemSpec = ButtonBarItemSpec.nibFile(nibName: "HomeTabCell", bundle: Bundle(for: HomeTabCell.self), width: { _ in
            return (UIScreen.main.bounds.width / 2) - 40
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTap()
        view.accessibilityIdentifier = LocalizableWords.AccessibilityIdentifier.ItemsTabBar
      
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
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
}
