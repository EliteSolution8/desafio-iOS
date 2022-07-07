//
//  Theme.swift
//  DigitalAccount
//
//  Created by Cai on 7/6/22.
//

import UIKit

// create UIColor extension and define used colors in the app

extension UIColor {
    
    enum LocalColorName: String {
        case colorPrimary       =       "#FE3E6D"
        
        case colorGray1         =       "#F0F4F8"
        case colorGray2         =       "#6B7076"
    }
    
    
    convenience init(_ name: LocalColorName) {
        self.init(name.rawValue)
    }
    
    static let colorPrimary = UIColor(.colorPrimary)
    
    static let colorGray1   = UIColor(.colorGray1)
    static let colorGray2   = UIColor(.colorGray2)
}




