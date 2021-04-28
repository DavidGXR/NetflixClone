//
//  ComingSoonVC.swift
//  NetflixClone
//
//  Created by David Im on 14/4/21.
//

import UIKit

class ComingSoonVC: UIViewController {

    private let tableView = UITableView()
    private var comingSoonBarItem = UIBarButtonItem()
    private var airplayButtonBarItem:UIBarButtonItem!
    private var profilePictureBarItem:UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    
    private func setupViews() {
        
        let airplayButton       = UIButton()
        let profilePictureButton  = UIButton()
                
        airplayButton.translatesAutoresizingMaskIntoConstraints = false
        profilePictureButton.translatesAutoresizingMaskIntoConstraints = false
        airplayButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        airplayButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        profilePictureButton.widthAnchor.constraint(equalToConstant: 28).isActive = true
        profilePictureButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        let largeAirplayButtonConfig = UIImage.SymbolConfiguration(scale: .large)
        let airplayButtonIcon = UIImage(systemName: "airplayvideo", withConfiguration: largeAirplayButtonConfig)
        airplayButton.setImage(airplayButtonIcon, for: .normal)
        airplayButton.tintColor = .white
        profilePictureButton.setImage(UIImage(named: "cristiano"), for: .normal)
        
        airplayButtonBarItem = UIBarButtonItem(customView: airplayButton)
        profilePictureBarItem = UIBarButtonItem(customView: profilePictureButton)
        
        comingSoonBarItem.title = "Coming Soon"
        comingSoonBarItem.tintColor = .white
        let strAttribute = [NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 18.0)!]
        comingSoonBarItem.setTitleTextAttributes(strAttribute, for: .normal)
        
        self.navigationItem.leftBarButtonItem = comingSoonBarItem
        self.navigationItem.rightBarButtonItems = [profilePictureBarItem, airplayButtonBarItem]
        
        
        

        
    }
    

}
