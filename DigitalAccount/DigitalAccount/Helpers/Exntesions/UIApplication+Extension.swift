//
//  UIApplication+Extension.swift
//  DigitalAccount
//
//  Created by Cai on 7/6/22.
//

import UIKit

extension UIApplication {
    
    class func safeAreaBottom() -> CGFloat {
        let window = UIApplication.shared.windows.first
        let bottomPadding: CGFloat
        if #available(iOS 11.0, *) {
            bottomPadding = window?.safeAreaInsets.bottom ?? 0.0
        } else {
            bottomPadding = 0.0
        }
        return bottomPadding
    }

    class func safeAreaTop() -> CGFloat {
        let window = UIApplication.shared.windows.first
        let topPadding: CGFloat
        if #available(iOS 11.0, *) {
            topPadding = window?.safeAreaInsets.top ?? 0.0
        } else {
            topPadding = 0.0
        }
        return topPadding
    }
}
