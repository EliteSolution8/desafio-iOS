//
//  AccountViewController.swift
//  DigitalAccount
//
//  Created by Cai on 7/6/22.
//

import UIKit

class AccountViewController: BaseViewController {
    
    private let businessNameLbl: UILabel = {
        let label = UILabel()
        label.font = Font.avenir(style: .roman, size: 17)
        label.textAlignment = .center
        label.textColor = .colorPrimary
        return label
    }()
    
    private let companyDetailLbl: UILabel = {
        let label = UILabel()
        label.font = Font.avenir(style: .book, size: 16)
        label.textColor = .colorGray2
        label.numberOfLines = 0
        return label
    }()
    
    private let menuTblView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 4, right: 0)
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    // let's use a hash map to build a separated group/section for the sign out menu
    private var sectionedMenu: Dictionary<String, [AccountMenu]> = [:]
    private let menuTitles = [
        "Dados pessoais",
        "Dados da empresa",
        "Perfis de acesso",
        "Meus contatos",
        "Configurações",
        "Ajuda",
        "Indique a Cora",
        "Sair"
    ]
    
    private let menuIconNames = [
        "person",
        "briefcase",
        "users",
        "contacts",
        "settings",
        "support",
        "profile.invite",
        "signout"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initMenu()
        
        setupViews()
        
        loadCompany()
    }

    override func setupViews() {
        view.backgroundColor = .colorGray1
        
        // the top business container
        let businessContainer = UIView()
        businessContainer.backgroundColor = .white
        view.addSubview(businessContainer)
        view.addConstraintWithFormat("H:|[v0]|", views: businessContainer)
        view.addConstraintWithFormat("V:|[v0]", views: businessContainer)
        
        // name container
        let businessNameContainer = UIView()
        businessNameContainer.backgroundColor = .colorGray1
        businessNameContainer.roundCorners(radius: 16)
        businessContainer.addSubview(businessNameContainer)
        businessContainer.addConstraintWithFormat("H:|-24-[v0]-24-|", views: businessNameContainer)
        
        let topPadding = 16 + UIApplication.safeAreaTop()
        businessContainer.addConstraintWithFormat("V:|-\(topPadding)-[v0(32)]", views: businessNameContainer)

        businessNameContainer.addSubview(businessNameLbl)
        businessNameContainer.addConstraintWithFormat("H:|-16-[v0]-16-|", views: businessNameLbl)
        NSLayoutConstraint.activate([
            businessNameLbl.centerYAnchor.constraint(equalTo: businessNameContainer.centerYAnchor)
        ])
        
        businessContainer.addSubview(companyDetailLbl)
        
        let copyContainer = UIView()
        businessContainer.addSubview(copyContainer)
        
        businessContainer.addConstraintWithFormat("H:|-24-[v0]-24-[v1]-24-|", views: companyDetailLbl, copyContainer)
        businessContainer.addConstraintWithFormat("V:[v0]-24-[v1]-24-|", views: businessNameContainer, companyDetailLbl)
        
        let copyImgView = UIImageView()
        copyImgView.image = UIImage(named: "copy")
        copyContainer.addSubview(copyImgView)
        // give 8px padding on all edges to give enough space on click
        copyContainer.addConstraintWithFormat("H:|-8-[v0(24)]-8-|", views: copyImgView)
        copyContainer.addConstraintWithFormat("V:|-8-[v0(24)]-8-|", views: copyImgView)
        
        let copyBtn = UIButton()
        copyBtn.addTarget(self, action: #selector(didTapCopy(_:)), for: .touchUpInside)
        copyContainer.addSubview(copyBtn)
        copyContainer.addConstraintWithFormat("H:|[v0]|", views: copyBtn)
        copyContainer.addConstraintWithFormat("V:|[v0]|", views: copyBtn)
        
        NSLayoutConstraint.activate([
            companyDetailLbl.centerYAnchor.constraint(equalTo: copyContainer.centerYAnchor)
        ])
        
        view.addSubview(menuTblView)
        view.addConstraintWithFormat("H:|[v0]|", views: menuTblView)
        view.addConstraintWithFormat("V:[v0][v1]|", views: businessContainer, menuTblView)
        
        if #available(iOS 15.0, *) {
            menuTblView.sectionHeaderTopPadding = 0.0
        }
        
        menuTblView.register(AccountMenuTableCell.self, forCellReuseIdentifier: AccountMenuTableCell.reuseIdentifier)
        menuTblView.dataSource = self
        menuTblView.delegate = self
    }
    
    private func initMenu() {
        for (index, title) in menuTitles.enumerated() {
            let sectionedKey = index >= menuTitles.count-1 ? "1" : "0"
            
            let menu = AccountMenu(iconName: menuIconNames[index], title: title , isAccessoryVisible: index == 6)
            
            if let _ = sectionedMenu.firstIndex(where: { $0.key == sectionedKey }) {
                sectionedMenu[sectionedKey]?.append(menu)
                
            } else {
                sectionedMenu[sectionedKey] = [menu]
            }
        }
    }
    
    private func loadCompany() {
        businessNameLbl.text = "Breiv Industries LTDA"
        
        let boldAttributes: [NSAttributedString.Key: Any] = [
            .font: Font.avenir(style: .heavy, size: 16)
        ]
        let attributedCompanyDetails = NSMutableAttributedString(string: "Cora SCD - ")
        attributedCompanyDetails.append(NSAttributedString(string: "403", attributes: boldAttributes))
        attributedCompanyDetails.append(NSAttributedString(string: "\n" + "Ag "))
        attributedCompanyDetails.append(NSAttributedString(string: "001", attributes: boldAttributes))
        attributedCompanyDetails.append(NSAttributedString(string: " - c/c "))
        attributedCompanyDetails.append(NSAttributedString(string: "4128344-6", attributes: boldAttributes))
        attributedCompanyDetails.append(NSAttributedString(string: "\n" + "CNPJ "))
        attributedCompanyDetails.append(NSAttributedString(string: "324.323.655/0001-72", attributes: boldAttributes))
        
        companyDetailLbl.attributedText = attributedCompanyDetails
    }
    
    @objc private func didTapCopy(_ sender: Any) {
        showAlert(Constants.AppName, message: "Coming soon", negative: "Close")
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension AccountViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionedMenu.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionedMenu["\(section)"]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountMenuTableCell.reuseIdentifier, for: indexPath) as! AccountMenuTableCell
        // configure the cell
        if let menusInSection = sectionedMenu["\(indexPath.section)"] {
            cell.configureCell(with: menusInSection[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64 // (56+8)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        view.tintColor = .clear
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 16
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            self.showAlert(Constants.AppName, message: "Coming soon", negative: "Close")
        }
    }
}
