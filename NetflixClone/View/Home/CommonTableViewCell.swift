//
//  CommonTableViewCell.swift
//  NetflixClone
//
//  Created by David Im on 16/4/21.
//

import UIKit

class CommonTableViewCell: UITableViewCell {
    
    var titleLabel:UILabel!
    var movieCollectionView:UICollectionView!
    let layout = UICollectionViewFlowLayout()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        titleLabel = UILabel()
        
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        movieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        movieCollectionView.register(CommonCollectionViewCell.self, forCellWithReuseIdentifier: "movieCell")
        
        movieCollectionView.allowsSelection = true
        movieCollectionView.isScrollEnabled = true
        movieCollectionView.alwaysBounceHorizontal = true
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(movieCollectionView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: movieCollectionView.topAnchor, constant: 0).isActive = true
        
        movieCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true
        movieCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        movieCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        movieCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
    }
    
}

