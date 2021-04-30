//
//  ComingSoonVC.swift
//  NetflixClone
//
//  Created by David Im on 14/4/21.
//

import UIKit
import AVKit
import AVFoundation

class ComingSoonVC: UIViewController, AVPlayerViewControllerDelegate {

    private var tableView:UITableView!
    private var comingSoonBarItem = UIBarButtonItem()
    private var airplayButtonBarItem:UIBarButtonItem!
    private var profilePictureBarItem:UIBarButtonItem!
    private var player:AVPlayer!
    
    private let movieData = [Movie(video: "londonhasfallen", logo: "londonhasfallen",title: "London has Fallen", description: "Mike, a Secret Service agent, must find a way to escape with his team when Barkawi, a terrorist, attacks all the world leaders attending the funeral of the British Prime Minister, James Wilson.", type: "Arcade"),
                             Movie(video: "ff", logo:"ff" ,title: "Fast & Furious 6", description: "Hobbs is tasked with catching a team of mercenary drivers who manage to evade him every time. However, he enlists the help of Dominic and his team in exchange for full pardons for their past crimes.", type: "Arcade")]
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    private func setupViews() {
        tableView = UITableView(frame: CGRect.zero, style: .grouped)
        self.view.addSubview(tableView)
        
        // Navigation Bar
        let airplayButton       = UIButton()
        let profilePictureButton  = UIButton()
                
        airplayButton.translatesAutoresizingMaskIntoConstraints = false
        profilePictureButton.translatesAutoresizingMaskIntoConstraints = false
        airplayButton.widthAnchor.constraint(equalToConstant: 28).isActive = true
        airplayButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        profilePictureButton.widthAnchor.constraint(equalToConstant: 28).isActive = true
        profilePictureButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        let airplayButtonIcon = UIImage(named: "airplay")
        airplayButton.setImage(airplayButtonIcon, for: .normal)
        profilePictureButton.setImage(UIImage(named: "cristiano"), for: .normal)
        
        airplayButtonBarItem = UIBarButtonItem(customView: airplayButton)
        profilePictureBarItem = UIBarButtonItem(customView: profilePictureButton)
        
        comingSoonBarItem.title = "Coming Soon"
        comingSoonBarItem.tintColor = .white
        let strAttribute = [NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 22.0)!]
        comingSoonBarItem.setTitleTextAttributes(strAttribute, for: .normal)
        
        self.navigationItem.leftBarButtonItem   = comingSoonBarItem
        self.navigationItem.rightBarButtonItems = [profilePictureBarItem, airplayButtonBarItem]
        
        // TableView
        tableView.dataSource = self
        tableView.delegate  = self
        tableView.rowHeight = 420
        tableView.separatorStyle = .none
        tableView.backgroundColor = .black
        tableView.register(ComingSoonTableViewCell.self, forCellReuseIdentifier: "comingSoonCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
    }
}

extension ComingSoonVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
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
            notificationView.backgroundColor = .black
            
            let bellImage = UIImageView()
            let notificationLabel = UILabel()
            let arrowImage = UIImageView()
            
            notificationView.addSubview(bellImage)
            notificationView.addSubview(notificationLabel)
            notificationView.addSubview(arrowImage)
            
            bellImage.translatesAutoresizingMaskIntoConstraints = false
            notificationLabel.translatesAutoresizingMaskIntoConstraints = false
            arrowImage.translatesAutoresizingMaskIntoConstraints = false
            
            bellImage.leadingAnchor.constraint(equalTo: notificationView.leadingAnchor, constant: 15).isActive = true
            bellImage.trailingAnchor.constraint(equalTo: notificationLabel.leadingAnchor, constant: -15).isActive = true
            bellImage.centerYAnchor.constraint(equalTo: notificationView.centerYAnchor).isActive = true
            bellImage.image = UIImage(systemName: "bell")
            bellImage.tintColor = .white
            bellImage.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
            
            notificationLabel.leadingAnchor.constraint(equalTo: bellImage.trailingAnchor, constant: 15).isActive = true
            notificationLabel.centerYAnchor.constraint(equalTo: notificationView.centerYAnchor).isActive = true
            notificationLabel.trailingAnchor.constraint(equalTo: arrowImage.leadingAnchor, constant: -5).isActive = true
            notificationLabel.text = "Notifications"
            notificationLabel.textColor = .white
            notificationLabel.font = UIFont(name: "Helvetica-Bold", size: 13.0)
            notificationLabel.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
            
            arrowImage.leadingAnchor.constraint(equalTo: notificationLabel.trailingAnchor, constant: 5).isActive = true
            arrowImage.trailingAnchor.constraint(equalTo: notificationView.trailingAnchor, constant: -15).isActive = true
            arrowImage.centerYAnchor.constraint(equalTo: notificationView.centerYAnchor).isActive = true
            arrowImage.image = UIImage(systemName: "chevron.right")
            arrowImage.tintColor = .white
            arrowImage.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
            
            return notificationView
        }else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "comingSoonCell") as! ComingSoonTableViewCell
        
        let path = Bundle.main.path(forResource: movieData[indexPath.section].video, ofType: "mp4")
        let url  = URL(fileURLWithPath: path!)
        player = AVPlayer(url: url)
        
        cell.avpController.delegate = self
        cell.avpController.player = player
        
        cell.movieLogo.image = UIImage(named: movieData[indexPath.section].logo)
        cell.movieTitle.text = movieData[indexPath.section].title
        cell.movieDescripton.text = movieData[indexPath.section].description
        cell.movieType.text = movieData[indexPath.section].type
        //player.play()
        
        return cell
    }
    
    
}
