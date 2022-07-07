//
//  BaseTableViewCell.swift
//  DigitalAccount
//
//  Created by Cai on 7/6/22.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupSubviews() {
        
    }
}

// MARK: UITableViewCell + Extension
extension UITableViewCell {
    
    class var reuseIdentifier: String {
        return String(describing: self)
    }
}
