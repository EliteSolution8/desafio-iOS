//
//  TabBarController.swift
//  DigitalAccount
//
//  Created by Cai on 7/6/22.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTabBar()
        self.delegate = self
    }
    
    private func setupTabBar() {
        var controllers = [UIViewController]()
        let home = HomeViewController()
        let homeNavController = NavigationController(rootViewController: home)
        let homeBarItemImage = UIImage(named: "tab.home")?.withRenderingMode(.alwaysTemplate)
        let homeBarItem = UITabBarItem(title: "Inicio", image: homeBarItemImage, selectedImage: homeBarItemImage)
        home.tabBarItem = homeBarItem
        
        controllers.append(homeNavController)
        
        let card = CardViewController()
        let cardNavController = NavigationController(rootViewController: card)
        let cardBarItemImage = UIImage(named: "tab.card")?.withRenderingMode(.alwaysTemplate)
        let cardBarItem = UITabBarItem(title: "Cartão", image: cardBarItemImage, selectedImage: cardBarItemImage)
        card.tabBarItem = cardBarItem
        controllers.append(cardNavController)
        
        let management = ManagementViewController()
        let managementNavController = NavigationController(rootViewController: management)
        let managementBarItemImage = UIImage(named: "tab.management")?.withRenderingMode(.alwaysTemplate)
        let managementBarItem = UITabBarItem(title: "Gestão", image: managementBarItemImage, selectedImage: managementBarItemImage)
        management.tabBarItem = managementBarItem
        controllers.append(managementNavController)
        
        let pix = PixViewController()
        let pixNavController = NavigationController(rootViewController: pix)
        let pixBarItemImage = UIImage(named: "tab.pix")?.withRenderingMode(.alwaysTemplate)
        let pixBarItem = UITabBarItem(title: "Pix", image: pixBarItemImage, selectedImage: pixBarItemImage)
        pix.tabBarItem = pixBarItem
        controllers.append(pixNavController)
        
        let account = AccountViewController()
        let accountNavController = NavigationController(rootViewController: account)
        accountNavController.isNavigationBarHidden = true
        let accountBarItemImage = UIImage(named: "tab.account")?.withRenderingMode(.alwaysTemplate)
        let accountBarItem = UITabBarItem(title: "Conta", image: accountBarItemImage, selectedImage: accountBarItemImage)
        account.tabBarItem = accountBarItem
        controllers.append(accountNavController)
        
        self.viewControllers = controllers
    }

}

// MARK: - UITabBarControllerDelegate
extension TabBarController: UITabBarControllerDelegate {
    
}
