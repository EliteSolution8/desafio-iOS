//
//  HomeViewController.swift
//  DigitalAccount
//
//  Created by Cai on 7/6/22.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
        
        // check custom fonts load
//        for family in UIFont.familyNames {
//            print(family)
//
//            for names in UIFont.fontNames(forFamilyName: family) {
//                print("== \(names)")
//            }
//        }
    }
    

    override func setupViews() {
        view.backgroundColor = .colorGray1
    }

}
