//
//  ComingSoonTableViewCell.swift
//  NetflixClone
//
//  Created by David Im on 26/4/21.
//

import UIKit
import AVKit
import AVFoundation

class ComingSoonTableViewCell: UITableViewCell {
    
    var videoView = UIView()
    let avpController = AVPlayerViewController()
    let movieLogo = UIImageView()
    let remindMeButton = UIButton()
    let infoButton = UIButton()
    let movieTitle = UILabel()
    let movieDescripton = UILabel()
    let movieType = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .black
        let views = [videoView, movieLogo, remindMeButton, infoButton, movieTitle, movieDescripton, movieType]
        for i in 0...views.count-1 {
            self.contentView.addSubview(views[i])
            views[i].translatesAutoresizingMaskIntoConstraints = false
        }
        
        videoView.backgroundColor = .yellow
        videoView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        videoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        videoView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        videoView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        videoView.bottomAnchor.constraint(equalTo: movieLogo.topAnchor, constant: -10).isActive = true
        
        avpController.videoGravity = AVLayerVideoGravity.resizeAspectFill
        avpController.view.frame.size.height = videoView.frame.size.height
        avpController.view.frame.size.width = videoView.frame.size.width
        videoView.addSubview(avpController.view)
        
        movieLogo.heightAnchor.constraint(equalToConstant: 70).isActive = true
        movieLogo.widthAnchor.constraint(equalToConstant: 90).isActive = true
        movieLogo.topAnchor.constraint(equalTo: videoView.bottomAnchor, constant: 10).isActive = true
        movieLogo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        movieLogo.bottomAnchor.constraint(equalTo: movieTitle.topAnchor, constant: -10).isActive = true
        
        let largePlusSign = UIImage.SymbolConfiguration(scale: .medium)
        let bellSign = UIImage(systemName: "bell", withConfiguration: largePlusSign)
        remindMeButton.setImage(bellSign, for: .normal)
        remindMeButton.tintColor = .white
        remindMeButton.topAnchor.constraint(equalTo: videoView.bottomAnchor, constant: 15).isActive = true
        remindMeButton.trailingAnchor.constraint(equalTo: infoButton.leadingAnchor, constant: 0).isActive = true
        remindMeButton.setTitle("Remind Me", for: .normal)
        remindMeButton.titleLabel?.font = UIFont(name: "Helvetica", size: 10)
        remindMeButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -70)
        remindMeButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -35, right: 0)
        
        let infoSign = UIImage(systemName: "info.circle", withConfiguration: largePlusSign)
        infoButton.setImage(infoSign, for: .normal)
        infoButton.tintColor = .white
        infoButton.topAnchor.constraint(equalTo: videoView.bottomAnchor, constant: 15).isActive = true
        infoButton.leadingAnchor.constraint(equalTo: remindMeButton.trailingAnchor, constant: 0).isActive = true
        infoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25).isActive = true
        infoButton.setTitle("Info", for: .normal)
        infoButton.titleLabel?.font = UIFont(name: "Helvetica", size: 10)
        infoButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -38)
        infoButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -35, right: 0)
        
        movieTitle.textColor = .white
        movieTitle.font = UIFont(name: "Helvetica-Bold", size: 13)
        movieTitle.topAnchor.constraint(equalTo: movieLogo.bottomAnchor, constant: 10).isActive = true
        movieTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        movieTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        movieTitle.bottomAnchor.constraint(equalTo: movieDescripton.topAnchor, constant: -5).isActive = true

        movieDescripton.textColor = .lightGray
        movieDescripton.font = UIFont(name: "Helvetica", size: 11.5)
        movieDescripton.numberOfLines = 3
        movieDescripton.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 5).isActive = true
        movieDescripton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        movieDescripton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        movieDescripton.bottomAnchor.constraint(equalTo: movieType.topAnchor, constant: -10).isActive = true

        movieType.textColor = .white
        movieType.font = UIFont(name: "Helvetica", size: 11.5)
        movieType.topAnchor.constraint(equalTo: movieDescripton.bottomAnchor, constant: 10).isActive = true
        movieType.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        movieType.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        movieType.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
}
