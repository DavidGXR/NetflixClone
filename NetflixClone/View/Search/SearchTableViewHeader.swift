//
//  SearchTableViewHeader.swift
//  NetflixClone
//
//  Created by David Im on 11/5/21.
//

import Foundation
import UIKit

class SearchTableViewHeader:UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Top Searches"
        label.font = UIFont(name: "Helvetica-Bold", size: 17)
        label.textColor = .white
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
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
}
