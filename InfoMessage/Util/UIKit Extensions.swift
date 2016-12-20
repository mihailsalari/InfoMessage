//
//  UIKit Extensions.swift
//  InfoMessage
//
//  Created by Mihail Șalari on 12/18/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    
    class var darkSkyBlue: UIColor {
        return UIColor.rgb(red: 38.0, green: 128.0, blue: 228.0, alpha: 1.0)
    }
}


extension UIView {
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}


extension UIColor {
    class var paleGrey: UIColor {
        return UIColor(red: 245.0 / 255.0, green: 245.0 / 255.0, blue: 247.0 / 255.0, alpha: 1.0)
    }
}

extension UIFont {
    class func textStyleFont(_ size: CGFloat) -> UIFont {
        
        if #available(iOS 8.2, *) {
            return UIFont.systemFont(ofSize: size, weight: UIFontWeightRegular)
        } else {
            // Fallback on earlier versions
            return UIFont.systemFont(ofSize: size)
        }
    }
    
    class func textStyle2Font(_ size: CGFloat) -> UIFont {
        
        if #available(iOS 8.2, *) {
            return UIFont.systemFont(ofSize: size, weight: UIFontWeightLight)
        } else {
            // Fallback on earlier versions
            return UIFont.systemFont(ofSize: size)
        }
    }
}
