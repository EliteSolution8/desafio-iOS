//
//  AppManager.swift
//  DigitalAccount
//
//  Created by Cai on 7/6/22.
//

import UIKit

class AppManager {
    
    static let shared = AppManager()
    
    private init() { }
    
    func initApplication() {
        // TO DO: Do any additional setup
        
        setupTabBar()
    }
    
    private func setupTabBar() {
        if #available(iOS 15.0, *)  {
            let tabBabrAppearance = UITabBarAppearance()
            tabBabrAppearance.configureWithOpaqueBackground()
            
            UITabBar.appearance().standardAppearance = tabBabrAppearance
            UITabBar.appearance().scrollEdgeAppearance = tabBabrAppearance
        }
        
        let appearance = UITabBar.appearance()
        appearance.isTranslucent = false
        appearance.tintColor = .colorPrimary
        appearance.unselectedItemTintColor = .colorGray2
        
        // remove the top 1px border
        appearance.layer.borderWidth = 0.0
        appearance.clipsToBounds = true
        
        let itemAppearance = UITabBarItem.appearance()
        itemAppearance.setTitleTextAttributes([.foregroundColor: UIColor.colorGray2,
                                               .font: Font.avenir(size: 10)],
                                              for: .normal)
        itemAppearance.setTitleTextAttributes([.foregroundColor: UIColor.colorPrimary,
                                               .font: Font.avenir(style: .roman, size: 10)],
                                              for: .selected)
    }
}
