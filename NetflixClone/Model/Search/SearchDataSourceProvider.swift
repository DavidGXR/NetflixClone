//
//  SearchDataSourceProvider.swift
//  NetflixClone
//
//  Created by David Im on 26/5/21.
//

import Foundation
import UIKit

class SearchDataSourceProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var dataManager:SearchDataManager?
    
    init(dataManager: SearchDataManager) {
        self.dataManager = dataManager
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchCell = tableView.dequeueReusableCell(withIdentifier: C.searchCell) as! SearchTableViewCell
        if let data = dataManager {
            searchCell.movieThumbnail.image = UIImage(named: data.moviePoster[indexPath.row])
            searchCell.titleLabel.text = data.movieTitle[indexPath.row]
        }

        return searchCell
    }
}
