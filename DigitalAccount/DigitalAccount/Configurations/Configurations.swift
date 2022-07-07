//
//  Configurations.swift
//  DigitalAccount
//
//  Created by Cai on 7/6/22.
//

import Foundation
import UIKit

struct ServerConfigs {
    
    static let DOMAIN_URL      =   "https://domain.com"
    static let API_BASE_URL    =   "https://api.domain.com"
}

struct Font {
    
    enum AvenirStyle: String {
        case book   = "Avenir-Book"
        case roman  = "Avenir-Roman"
        case heavy  = "Avenir-Heavy"
    }
    
    static func avenir(style: AvenirStyle = .book, size: CGFloat) -> UIFont {
        return UIFont(name: style.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}

struct AppConfigs {
        
}
