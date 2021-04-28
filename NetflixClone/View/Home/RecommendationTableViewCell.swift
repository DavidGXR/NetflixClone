//
//  HomeTableViewCell.swift
//  NetflixClone
//
//  Created by David Im on 14/4/21.
//

import UIKit

class RecommendationTableViewCell: UITableViewCell {

    let backgroundImage = UIImageView()
    let netflixIcon     = UIButton()
    let airplayButton   = UIButton()
    let accountButton   = UIButton()
    let tvshowButton    = UIButton()
    let movieButton     = UIButton()
    let categoriesButton = UIButton()
    let mylistButton    = UIButton()
    let playButton      = UIButton()
    let infoButton      = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(backgroundImage)
        
        let subViews = [netflixIcon, airplayButton, accountButton, tvshowButton, movieButton, categoriesButton, mylistButton, playButton, infoButton]
        for i in 0...subViews.count-1 {
            backgroundImage.addSubview(subViews[i])
        }
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let topStackView = UIStackView()
        let bottomStackView = UIStackView()
        backgroundImage.addSubview(topStackView)
        backgroundImage.addSubview(bottomStackView)
        
        let subViews = [topStackView, bottomStackView, backgroundImage, netflixIcon, airplayButton, accountButton, tvshowButton, movieButton, categoriesButton, mylistButton, playButton, infoButton]
        for i in 0...subViews.count-1 {
            subViews[i].translatesAutoresizingMaskIntoConstraints = false
        }
        backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive      = true
        backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive    = true
        backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive        = true
        backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive              = true
                        
        netflixIcon.setImage(UIImage(named: "netflix_icon"), for: .normal)
        netflixIcon.heightAnchor.constraint(equalToConstant: 50).isActive = true
        netflixIcon.widthAnchor.constraint(equalToConstant: 50).isActive = true
        netflixIcon.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 35).isActive = true
        netflixIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
      
        airplayButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        airplayButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        accountButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        accountButton.widthAnchor.constraint(equalToConstant: 28).isActive = true
        airplayButton.setImage(UIImage(systemName: "airplayvideo"), for: .normal)
        accountButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        accountButton.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 35).isActive = true
        airplayButton.trailingAnchor.constraint(equalTo: accountButton.leadingAnchor, constant: -5).isActive = true
        airplayButton.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 35).isActive = true
        let largeConfig = UIImage.SymbolConfiguration(scale: .large)
        let airplayButtonIcon = UIImage(systemName: "airplayvideo", withConfiguration: largeConfig)
        airplayButton.setImage(airplayButtonIcon, for: .normal)
        airplayButton.tintColor = .white
        accountButton.setImage(UIImage(named: "cristiano"), for: .normal)
        
        topStackView.axis = .horizontal
        topStackView.alignment = .fill
        topStackView.distribution = .fillEqually
        topStackView.spacing = 0

        topStackView.topAnchor.constraint(equalTo: netflixIcon.bottomAnchor, constant: 10).isActive = true
        topStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        topStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        topStackView.addArrangedSubview(tvshowButton)
        topStackView.addArrangedSubview(movieButton)
        topStackView.addArrangedSubview(categoriesButton)

        tvshowButton.setTitle("TV Shows", for: .normal)
        movieButton.setTitle("Movies", for: .normal)
        categoriesButton.setTitle("Categories", for: .normal)
        tvshowButton.titleLabel?.font = UIFont(name: "Helvetica", size: 13)
        movieButton.titleLabel?.font = UIFont(name: "Helvetica", size: 13)
        categoriesButton.titleLabel?.font = UIFont(name: "Helvetica", size: 13)
        
        bottomStackView.axis = .horizontal
        bottomStackView.alignment = .fill
        bottomStackView.distribution = .fillEqually
        bottomStackView.spacing = 0

        bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        bottomStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        bottomStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        bottomStackView.addArrangedSubview(mylistButton)
        bottomStackView.addArrangedSubview(playButton)
        bottomStackView.addArrangedSubview(infoButton)
        
        let largePlusSign = UIImage.SymbolConfiguration(scale: .medium)
        let plusSign = UIImage(systemName: "plus", withConfiguration: largePlusSign)
        mylistButton.setImage(plusSign, for: .normal)
        mylistButton.tintColor = .white
       
        mylistButton.setTitle("My List", for: .normal)
        mylistButton.titleLabel?.font = UIFont(name: "Helvetica", size: 10)
        mylistButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -50)
        mylistButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -35, right: 0)
        
        let largePlaySign = UIImage.SymbolConfiguration(scale: .large)
        let playSign = UIImage(systemName: "play.rectangle.fill", withConfiguration: largePlaySign)
        playButton.setImage(playSign, for: .normal)
        playButton.tintColor = .white
        
        let largeInfoSign = UIImage.SymbolConfiguration(scale: .medium)
        let infoSign = UIImage(systemName: "info.circle", withConfiguration: largeInfoSign)
        infoButton.setImage(infoSign, for: .normal)
        infoButton.tintColor = .white
       
        infoButton.setTitle("Info", for: .normal)
        infoButton.titleLabel?.font = UIFont(name: "Helvetica", size: 10)
        infoButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -37)
        infoButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -35, right: 0)
        

        
    }
    
    

}
