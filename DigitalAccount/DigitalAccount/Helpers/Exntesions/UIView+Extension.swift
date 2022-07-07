//
//  UIView+Extension.swift
//  DigitalAccount
//
//  Created by Cai on 7/6/22.
//

import UIKit

extension UIView {
    
    /**
     H: (Horizontal) //horizontal direction
     V: (Vertical) //vertical direction
     | (pipe) //superview
     - (dash) //standard spacing (generally 8 points)
     [] (brackets) //name of the object (uilabel, unbutton, uiview, etc.)
     () (parentheses) //size of the object
     == equal widths //can be omitted
     -16- non standard spacing (16 points)
     <= less than or equal to
     >= greater than or equal to
     @250 priority of the constraint //can have any value between 0 and 1000
    **/
    // MARK: - AutoLayout Extension for UIView
    func addConstraintWithFormat(_ format : String, views : UIView...) {
        var viewsDictionary = [String : UIView]()

        for(index, view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    func roundCorners(corners: CACornerMask =
                        [.layerMinXMinYCorner,
                         .layerMaxXMinYCorner,
                         .layerMinXMaxYCorner,
                         .layerMaxXMaxYCorner], radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
        layer.maskedCorners = corners
    }
}
