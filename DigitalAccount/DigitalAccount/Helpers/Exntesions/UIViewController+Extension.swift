//
//  UIViewController+Extension.swift
//  DigitalAccount
//
//  Created by Cai on 7/6/22.
//

import UIKit

extension UIViewController {
    
    /// show an alert with action buttons
    func showAlert(_ title: String?, message: String?, positive: String? = nil, positiveAction: ((_ positiveAction: UIAlertAction) -> Void)? = nil, negative: String? = nil, negativeAction: ((_ negativeAction: UIAlertAction) -> Void)? = nil, preferredStyle: UIAlertController.Style = .alert) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        if negative != nil {
            let negAction = UIAlertAction(title: negative, style: .cancel, handler: negativeAction)
            alert.addAction(negAction)
        }
        
        if positive != nil {
            let posAction = UIAlertAction(title: positive, style: .default, handler: positiveAction)
            alert.addAction(posAction)
        }
        
        present(alert, animated: true)
    }
}
