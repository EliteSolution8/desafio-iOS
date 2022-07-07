//
//  AccountMenuTableCell.swift
//  DigitalAccount
//
//  Created by Cai on 7/6/22.
//

import UIKit

class AccountMenuTableCell: BaseTableViewCell {
    
    private let titleLbl: UILabel = {
        let label = UILabel()
        label.font = Font.avenir(style: .book, size: 16)
        label.textColor = .colorPrimary
        return label
    }()
    
    private let iconImgView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let menuAccessoryView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "chevron.down")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupSubviews() {
        backgroundColor = .clear
        selectionStyle = .none
        
        let container = UIView()
        container.backgroundColor = .white
        container.roundCorners(radius: 10)
        addSubview(container)
        
        addConstraintWithFormat("H:|-20-[v0]-20-|", views: container)
        addConstraintWithFormat("V:|-4-[v0]-4-|", views: container)
        
        container.addSubview(iconImgView)
        container.addSubview(titleLbl)
        container.addSubview(menuAccessoryView)
        
        container.addConstraintWithFormat("H:|-16-[v0(24)]-16-[v1]-16-[v2(24)]-16-|", views: iconImgView, titleLbl, menuAccessoryView)
        container.addConstraintWithFormat("V:[v0(24)]", views: iconImgView)
        container.addConstraintWithFormat("V:[v0(24)]", views: menuAccessoryView)
        
        NSLayoutConstraint.activate([
            iconImgView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            iconImgView.centerYAnchor.constraint(equalTo: titleLbl.centerYAnchor),
            titleLbl.centerYAnchor.constraint(equalTo: menuAccessoryView.centerYAnchor)
        ])
    }
    
    func configureCell(with menu: AccountMenu) {
        iconImgView.image = UIImage(named: menu.iconName)
        titleLbl.text = menu.title
        
        menuAccessoryView.isHidden = !menu.isAccessoryVisible
    }
}
