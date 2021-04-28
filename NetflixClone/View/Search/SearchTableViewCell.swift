//
//  SearchTableViewCell.swift
//  NetflixClone
//
//  Created by David Im on 20/4/21.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    let movieThumbnail = UIImageView()
    let titleLabel = UILabel()
    let playButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .black
        contentView.addSubview(movieThumbnail)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playButton)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieThumbnail.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        movieThumbnail.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        movieThumbnail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        movieThumbnail.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -10).isActive = true
        movieThumbnail.heightAnchor.constraint(equalToConstant: 70).isActive = true
        movieThumbnail.widthAnchor.constraint(equalToConstant: 110).isActive = true
        movieThumbnail.clipsToBounds = true
        movieThumbnail.layer.cornerRadius = 4
        
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: movieThumbnail.trailingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: playButton.leadingAnchor, constant: 0).isActive = true
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.5
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Helvetica-Bold", size: 12.5)
        
        playButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        playButton.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 0).isActive = true
        playButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .medium, scale: .large)
        let playIcon = UIImage(systemName: "play.circle", withConfiguration: largeConfig)
        playButton.setImage(playIcon, for: .normal)
        playButton.tintColor = .white
        
    }
    
}
