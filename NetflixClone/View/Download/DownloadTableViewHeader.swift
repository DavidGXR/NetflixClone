//
//  DownloadTableViewHeader.swift
//  NetflixClone
//
//  Created by David Im on 7/5/21.
//

import Foundation
import UIKit

class DownloadTableViewHeader:UIView {
    
    private let infoIcon: UIImageView = {
        let icon = UIImageView()
        let largeConfig = UIImage.SymbolConfiguration(scale: .large)
        icon.image = UIImage(systemName: "info.circle", withConfiguration: largeConfig)
        icon.tintColor = .white
        icon.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        return icon
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Smart Downloads"
        label.textColor = .white
        label.font = UIFont(name: "Helvetica-Bold", size: 13.0)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = UIColor(red: 32/255.0, green: 32/255.0, blue: 32/255.0, alpha: 1)
        addSubview(infoIcon)
        addSubview(titleLabel)
        
        infoIcon.translatesAutoresizingMaskIntoConstraints = false
        infoIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        infoIcon.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -8).isActive = true
        infoIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: infoIcon.trailingAnchor, constant: 8).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
    }
    
}
