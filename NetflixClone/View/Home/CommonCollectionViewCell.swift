//
//  CommonCollectionViewCell.swift
//  NetflixClone
//
//  Created by David Im on 16/4/21.
//

import UIKit

class CommonCollectionViewCell: UICollectionViewCell {
    
    let movieImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(movieImage)
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        movieImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        movieImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        movieImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        movieImage.clipsToBounds = true
        movieImage.layer.cornerRadius = 4
        movieImage.layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
