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

        topStackView.axis = .horizontal
        topStackView.alignment = .fill
        topStackView.distribution = .fillEqually
        topStackView.spacing = 0

        topStackView.topAnchor.constraint(equalTo: topAnchor, constant: 100).isActive = true
        topStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        topStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        topStackView.addArrangedSubview(tvshowButton)
        topStackView.addArrangedSubview(movieButton)
        topStackView.addArrangedSubview(categoriesButton)

        tvshowButton.setTitle("TV Shows", for: .normal)
        movieButton.setTitle("Movies", for: .normal)
        categoriesButton.setTitle("Categories", for: .normal)
        tvshowButton.titleLabel?.font = UIFont(name: "Helvetica", size: 14)
        movieButton.titleLabel?.font = UIFont(name: "Helvetica", size: 14)
        categoriesButton.titleLabel?.font = UIFont(name: "Helvetica", size: 14)
        
        tvshowButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        categoriesButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30)
        
        bottomStackView.axis = .horizontal
        bottomStackView.alignment = .fill
        bottomStackView.distribution = .fillEqually
        bottomStackView.spacing = 0

        bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        bottomStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        bottomStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        bottomStackView.addArrangedSubview(mylistButton)
        bottomStackView.addArrangedSubview(playButton)
        bottomStackView.addArrangedSubview(infoButton)
        
        mylistButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        infoButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        playButton.layer.cornerRadius = 3
        
        let largeSign = UIImage.SymbolConfiguration(scale: .large)
        let plusSign = UIImage(systemName: "plus", withConfiguration: largeSign)
        mylistButton.setImage(plusSign, for: .normal)
        mylistButton.tintColor = .white
        //mylistButton.backgroundColor = .red
        
        mylistButton.setTitle("My List", for: .normal)
        mylistButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 12)
        mylistButton.imageEdgeInsets = UIEdgeInsets(top: -10, left: 20, bottom: 0, right: 0)
        mylistButton.titleEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: -22, right: 30)
        
        let playSign = UIImage(systemName: "play.fill", withConfiguration: largeSign)
        playButton.setImage(playSign, for: .normal)
        playButton.imageView?.tintColor = .black
        playButton.backgroundColor = .white
        playButton.setTitle("Play", for: .normal)
        playButton.setTitleColor(.black, for: .normal)
        playButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 16)
        playButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -25, bottom: 0, right: 0)
        
        let infoSign = UIImage(systemName: "info.circle", withConfiguration: largeSign)
        infoButton.setImage(infoSign, for: .normal)
        infoButton.tintColor = .white
        //infoButton.backgroundColor = .red
       
        infoButton.setTitle("Info", for: .normal)
        infoButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 12)
        infoButton.imageEdgeInsets = UIEdgeInsets(top: -10, left: 0, bottom: 0, right: -44)
        infoButton.titleEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: -22, right: 0)
    }
    
    

}
