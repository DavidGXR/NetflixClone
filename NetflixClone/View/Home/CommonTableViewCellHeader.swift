//
//  CommonTableViewCellHeader.swift
//  NetflixClone
//
//  Created by David Im on 12/5/21.
//

import Foundation
import UIKit

class CommonTableViewCellHeader:UIView {
    
    var titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        self.addSubview(titleLabel)
        self.backgroundColor = .black
        titleLabel.font = UIFont(name: "Helvetica-Bold", size: 17)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
}
