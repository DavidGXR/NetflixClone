//
//  RightItems.swift
//  NetflixClone
//
//  Created by David Im on 7/5/21.
//

import Foundation
import UIKit

class RightBarItems:UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let airplayButton         = UIButton()
        let profilePictureButton  = UIButton()
                
        airplayButton.translatesAutoresizingMaskIntoConstraints = false
        profilePictureButton.translatesAutoresizingMaskIntoConstraints = false
        airplayButton.widthAnchor.constraint(equalToConstant: 28).isActive = true
        airplayButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        profilePictureButton.widthAnchor.constraint(equalToConstant: 28).isActive = true
        profilePictureButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        airplayButton.setImage(UIImage(named: "airplay"), for: .normal)
        profilePictureButton.setImage(UIImage(named: "cristiano"), for: .normal)
        
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.spacing = 35
        self.addArrangedSubview(airplayButton)
        self.addArrangedSubview(profilePictureButton)
    }
    
}
