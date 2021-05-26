//
//  ComingSoonDataSourceProvider.swift
//  NetflixClone
//
//  Created by David Im on 26/5/21.
//

import Foundation
import UIKit
import AVKit

class ComingSoonDataSourceProvider: NSObject, UITableViewDataSource, UITableViewDelegate, AVPlayerViewControllerDelegate {
    
    private var dataManager:ComingSoonDataManager?
    private var player:AVPlayer?
    
    init(dataManager: ComingSoonDataManager) {
        self.dataManager = dataManager
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = dataManager {
            return data.movieData.count
        } else {
            return 0
        }
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: C.comingSoonCell) as! ComingSoonTableViewCell
        
        if let data = dataManager {
            let path = Bundle.main.path(forResource: data.movieData[indexPath.row].video, ofType: C.videoType)
            let url  = URL(fileURLWithPath: path!)
            player   = AVPlayer(url: url)
            
            cell.avpController.delegate = self
            cell.avpController.player   = player
            
            cell.movieLogo.image        = UIImage(named: data.movieData[indexPath.row].logo)
            cell.movieTitle.text        = data.movieData[indexPath.row].title
            cell.movieDescripton.text   = data.movieData[indexPath.row].description
            cell.movieType.text         = data.movieData[indexPath.row].type
            //player.play()
        }
        return cell
    }
}
