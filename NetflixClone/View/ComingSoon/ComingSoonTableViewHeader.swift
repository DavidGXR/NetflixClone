//
//  ComingSoonTableViewHeader.swift
//  NetflixClone
//
//  Created by David Im on 7/5/21.
//

import Foundation
import UIKit

class ComingSoonTableViewHeader:UIView {
    
    private let bellIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "bell")
        icon.tintColor = .white
        return icon
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Notifications"
        label.textColor = .white
        label.font = UIFont(name: "Helvetica-Bold", size: 13.0)
        return label
    }()
    
    private let arrowIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "chevron.right")
        icon.tintColor = .white
        return icon
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = .black
        addSubview(bellIcon)
        addSubview(titleLabel)
        addSubview(arrowIcon)
        
        bellIcon.translatesAutoresizingMaskIntoConstraints = false
        bellIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        bellIcon.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -15).isActive = true
        bellIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        bellIcon.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: bellIcon.trailingAnchor, constant: 15).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: arrowIcon.leadingAnchor, constant: -5).isActive = true
        titleLabel.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
        
        arrowIcon.translatesAutoresizingMaskIntoConstraints = false
        arrowIcon.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 5).isActive = true
        arrowIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        arrowIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        arrowIcon.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
    }

}
