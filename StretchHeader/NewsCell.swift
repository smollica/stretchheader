//
//  NewsCell.swift
//  StretchHeader
//
//  Created by Monica Mollica on 2016-04-12.
//  Copyright © 2016 Sergio Mollica. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!
    
    // MARK: Functions
    
    func setCategoryColour(category:String) -> UIColor {
        switch category {
        case "World":
            return UIColor.redColor()
        case "Americas":
            return UIColor.blueColor()
        case "Europe":
            return UIColor.greenColor()
        case "Middle East":
            return UIColor.yellowColor()
        case "Africa":
            return UIColor.orangeColor()
        case "Asia Pacific":
            return UIColor.purpleColor()
        default:
            return UIColor.blackColor()
        }
    }
}
