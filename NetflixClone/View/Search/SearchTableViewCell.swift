//
//  SearchTableViewCell.swift
//  NetflixClone
//
//  Created by David Im on 20/4/21.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    let movieThumbnail:UIImageView = {
        let image = UIImageView()
        image.heightAnchor.constraint(equalToConstant: 70).isActive = true
        image.widthAnchor.constraint(equalToConstant: 110).isActive = true
        image.clipsToBounds = true
        image.layer.cornerRadius = 4
        return image
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = .white
        label.font = UIFont(name: "Helvetica-Bold", size: 12.5)
        return label
    }()
    
    private let playButton:UIButton = {
        let button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .medium, scale: .large)
        let playIcon = UIImage(systemName: "play.circle", withConfiguration: largeConfig)
        button.setImage(playIcon, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.contentView.backgroundColor = .black
        contentView.addSubview(movieThumbnail)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playButton)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieThumbnail.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        movieThumbnail.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        movieThumbnail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        movieThumbnail.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -10).isActive = true
        
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: movieThumbnail.trailingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: playButton.leadingAnchor, constant: 0).isActive = true

        playButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        playButton.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 0).isActive = true
        playButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
            
    }
    
}
