//
//  HomeTableViewCell.swift
//  NetflixClone
//
//  Created by David Im on 14/4/21.
//

import UIKit

class RecommendationTableViewCell: UITableViewCell {
    
    let backgroundImage = UIImageView()
    
    private let netflixIcon     = UIButton()
    private let rightBarItems   = RightBarItems()
    
    private let topStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    private let bottomStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    private let tvshowButton:UIButton = {
        let button = UIButton()
        button.setTitle("TV Shows", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 14)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        return button
    }()
    
    private let movieButton:UIButton = {
        let button = UIButton()
        button.setTitle("Movies", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 14)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        return button
    }()
    
    private let categoriesButton:UIButton = {
        let button = UIButton()
        button.setTitle("Categories", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 14)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30)
        return button
    }()
    
    private let mylistButton:UIButton = {
        let button = UIButton()
        let largeSign = UIImage.SymbolConfiguration(scale: .large)
        let plusSign = UIImage(systemName: "plus", withConfiguration: largeSign)
        button.setImage(plusSign, for: .normal)
        button.tintColor = .white
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.setTitle("My List", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 12)
        button.imageEdgeInsets = UIEdgeInsets(top: -10, left: 20, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: -22, right: 30)
        return button
    }()
    
    private let playButton:UIButton = {
        let button = UIButton()
        let largeSign = UIImage.SymbolConfiguration(scale: .large)
        let playSign = UIImage(systemName: "play.fill", withConfiguration: largeSign)
        button.setImage(playSign, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.layer.cornerRadius = 3
        button.imageView?.tintColor = .black
        button.backgroundColor = .white
        button.setTitle("Play", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 16)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -25, bottom: 0, right: 0)
        return button
    }()
    
    private let infoButton:UIButton = {
        let button = UIButton()
        let largeSign = UIImage.SymbolConfiguration(scale: .large)
        let infoSign = UIImage(systemName: "info.circle", withConfiguration: largeSign)
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.setImage(infoSign, for: .normal)
        button.tintColor = .white
        button.setTitle("Info", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 12)
        button.imageEdgeInsets = UIEdgeInsets(top: -10, left: 0, bottom: 0, right: -44)
        button.titleEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: -22, right: 0)
        return button
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(backgroundImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - layoutSubViews
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let subViews = [topStackView, bottomStackView, netflixIcon, rightBarItems, tvshowButton, movieButton, categoriesButton, mylistButton, playButton, infoButton]
        for i in 0...subViews.count-1 {
            backgroundImage.addSubview(subViews[i])
            subViews[i].translatesAutoresizingMaskIntoConstraints = false
        }
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive      = true
        backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive    = true
        backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive        = true
        backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive              = true
        
        netflixIcon.translatesAutoresizingMaskIntoConstraints = false
        netflixIcon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        netflixIcon.heightAnchor.constraint(equalToConstant: 45).isActive = true
        netflixIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17).isActive = true
        netflixIcon.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        netflixIcon.bottomAnchor.constraint(equalTo: topStackView.topAnchor, constant: -10).isActive = true
        netflixIcon.setImage(UIImage(named: "netflix_icon"), for: .normal)
        
        rightBarItems.translatesAutoresizingMaskIntoConstraints = false
        rightBarItems.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17).isActive = true
        rightBarItems.topAnchor.constraint(equalTo: topAnchor, constant: 46.5).isActive = true
        
        topStackView.addArrangedSubview(tvshowButton)
        topStackView.addArrangedSubview(movieButton)
        topStackView.addArrangedSubview(categoriesButton)
        topStackView.topAnchor.constraint(equalTo: netflixIcon.bottomAnchor, constant: 10).isActive = true
        topStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        topStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        bottomStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        bottomStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        bottomStackView.addArrangedSubview(mylistButton)
        bottomStackView.addArrangedSubview(playButton)
        bottomStackView.addArrangedSubview(infoButton)
    }

}
