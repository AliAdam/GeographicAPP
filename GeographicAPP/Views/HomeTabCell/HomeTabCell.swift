

import Foundation
import UIKit

class HomeTabCell: UICollectionViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLab: UILabel!
    
    open class func cellIdentifier() -> String {
        return "HomeTabCell"
    }

}
