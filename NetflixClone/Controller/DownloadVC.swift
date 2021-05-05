//
//  DownloadVC.swift
//  NetflixClone
//
//  Created by David Im on 14/4/21.
//

import UIKit

class DownloadVC: UIViewController {

    private var tableView:UITableView!
    private var myDownloadBarItem = UIBarButtonItem()
    private var rightBarItem:UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    private func setupViews() {
        tableView = UITableView(frame: CGRect.zero, style: .grouped)
        self.view.addSubview(tableView)
        
        // Navigation Bar
        let airplayButton         = UIButton()
        let profilePictureButton  = UIButton()
        let rightItemStackView    = UIStackView()
                
        airplayButton.translatesAutoresizingMaskIntoConstraints = false
        profilePictureButton.translatesAutoresizingMaskIntoConstraints = false
        airplayButton.widthAnchor.constraint(equalToConstant: 28).isActive = true
        airplayButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        profilePictureButton.widthAnchor.constraint(equalToConstant: 28).isActive = true
        profilePictureButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        airplayButton.setImage(UIImage(named: "airplay"), for: .normal)
        profilePictureButton.setImage(UIImage(named: "cristiano"), for: .normal)
        
        rightItemStackView.axis = .horizontal
        rightItemStackView.distribution = .fillEqually
        rightItemStackView.spacing = 35
        rightItemStackView.addArrangedSubview(airplayButton)
        rightItemStackView.addArrangedSubview(profilePictureButton)
        
        rightBarItem = UIBarButtonItem(customView: rightItemStackView)
        
        myDownloadBarItem.title = "My Downloads"
        myDownloadBarItem.tintColor = .white
        let strAttribute = [NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 22.0)!]
        myDownloadBarItem.setTitleTextAttributes(strAttribute, for: .normal)
        
        self.navigationItem.leftBarButtonItem   = myDownloadBarItem
        self.navigationItem.rightBarButtonItem  = rightBarItem
        
        // TableView
        tableView.dataSource = self
        tableView.delegate  = self
        tableView.rowHeight = 420
        tableView.separatorStyle = .none
        tableView.backgroundColor = .black
        tableView.register(DownloadTableViewCell.self, forCellReuseIdentifier: "myDownloadCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
    }
}

extension DownloadVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 40
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if (section == 0) {
            let notificationView = UIView()
            notificationView.backgroundColor = UIColor(red: 32/255.0, green: 32/255.0, blue: 32/255.0, alpha: 1)
            //notificationView.alpha = 0.5
            
            let infoIcon = UIImageView()
            let myDownloadLabel = UILabel()
            
            notificationView.addSubview(infoIcon)
            notificationView.addSubview(myDownloadLabel)
            
            infoIcon.translatesAutoresizingMaskIntoConstraints = false
            myDownloadLabel.translatesAutoresizingMaskIntoConstraints = false
            
            infoIcon.leadingAnchor.constraint(equalTo: notificationView.leadingAnchor, constant: 15).isActive = true
            infoIcon.trailingAnchor.constraint(equalTo: myDownloadLabel.leadingAnchor, constant: -8).isActive = true
            infoIcon.centerYAnchor.constraint(equalTo: notificationView.centerYAnchor).isActive = true
            let largeConfig = UIImage.SymbolConfiguration(scale: .large)
            infoIcon.image = UIImage(systemName: "info.circle", withConfiguration: largeConfig)
            infoIcon.tintColor = .white
            infoIcon.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
            
            myDownloadLabel.leadingAnchor.constraint(equalTo: infoIcon.trailingAnchor, constant: 8).isActive = true
            myDownloadLabel.centerYAnchor.constraint(equalTo: notificationView.centerYAnchor).isActive = true
            myDownloadLabel.trailingAnchor.constraint(equalTo: notificationView.trailingAnchor, constant: 0).isActive = true
            myDownloadLabel.text = "Smart Downloads"
            myDownloadLabel.textColor = .white
            myDownloadLabel.font = UIFont(name: "Helvetica-Bold", size: 13.0)
            myDownloadLabel.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
            
            
            return notificationView
        }else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myDownloadCell") as! DownloadTableViewCell
        
        return cell
    }
}
