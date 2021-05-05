//
//  CommonTableViewCell.swift
//  NetflixClone
//
//  Created by David Im on 16/4/21.
//

import UIKit

class CommonTableViewCell: UITableViewCell {
    
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
    
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        movieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        movieCollectionView.register(CommonCollectionViewCell.self, forCellWithReuseIdentifier: "movieCell")
        
        movieCollectionView.allowsSelection = true
        movieCollectionView.isScrollEnabled = true
        movieCollectionView.alwaysBounceHorizontal = true
        self.contentView.addSubview(movieCollectionView)
        
        movieCollectionView.translatesAutoresizingMaskIntoConstraints = false
        movieCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        movieCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        movieCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        movieCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
}

