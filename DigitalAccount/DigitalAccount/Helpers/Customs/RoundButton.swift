//
//  RoundButton.swift
//  DigitalAccount
//
//  Created by Cai on 7/6/22.
//

import UIKit

class RoundButton: UIButton {

    var cornerRadius: CGFloat = 6.0
    var borderWidth: CGFloat = 0.0
    var borderColor: UIColor = .clear
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        initView()
    }
    
    private func initView() {
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        layer.masksToBounds = true
    }
    
}
