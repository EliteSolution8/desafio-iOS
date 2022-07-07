//
//  IntroViewController.swift
//  DigitalAccount
//
//  Created by Cai on 7/6/22.
//

import UIKit

class IntroViewController: BaseViewController {
    
    @IBOutlet private weak var contentScrollView: UIScrollView!
    @IBOutlet private weak var subheadingLbl: UILabel!
    
    @IBOutlet private weak var registerBtn: RoundButton!
    @IBOutlet private weak var loginBtn: RoundButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupViews()
    }
    
    override func setupViews() {
        view.backgroundColor = .colorPrimary
        
        contentScrollView.contentInsetAdjustmentBehavior = .never
        
        subheadingLbl.text = Constants.AppStrings.INTRO_SUBHEADING
        subheadingLbl.font = Font.avenir(style: .book, size: 16)
        subheadingLbl.textColor = .white
        subheadingLbl.numberOfLines = 0
        subheadingLbl.setLineSpacing(lineHeightMultiple: 1.3)
                
        registerBtn.backgroundColor = .white
        registerBtn.cornerRadius = 10
        registerBtn.setTitle(Constants.AppStrings.WANNA_BE_PART, for: .normal)
        registerBtn.titleLabel?.font = Font.avenir(style: .book, size: 17)
        registerBtn.setTitleColor(.colorPrimary, for: .normal)
        registerBtn.contentHorizontalAlignment = .left
        
        if #available(iOS 15.0, *) {
            
        } else {
            registerBtn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        }
        
        loginBtn.cornerRadius = 10
        loginBtn.borderColor = .white
        loginBtn.borderWidth = 1
        loginBtn.setTitle(Constants.AppStrings.ALREADY_CUSTOMER, for: .normal)
        loginBtn.titleLabel?.font = Font.avenir(style: .book, size: 16)
        loginBtn.setTitleColor(.white, for: .normal)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction private func didTapLogin() {
        // should go to the login page
        // Just get to the main page for testing
        gotoMain()
    }
    
    @IBAction private func didTapRegister() {
        // should go to the register page
        // Just get to the main page for testing
        gotoMain()
    }
    
    private func gotoMain() {
        let tabBarController = TabBarController()
        
        guard let keyWindow = UIApplication.shared.windows.first else { return }
        keyWindow.rootViewController = tabBarController
    }
}

