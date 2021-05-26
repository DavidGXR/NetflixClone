//
//  HomeDataSourceProvider.swift
//  NetflixClone
//
//  Created by David Im on 26/5/21.
//

import Foundation
import UIKit

class HomeDataSourceProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var dataManager:HomeDataManager?
    private var mainView    = UIView()
    
    init(dataManager: HomeDataManager, view: UIView) {
        self.dataManager = dataManager
        self.mainView    = view
        super.init()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if (section == 0) {
            return nil
        } else {
            let header = CommonTableViewCellHeader(frame: CGRect(x: 0, y: 0, width: self.mainView.bounds.width, height: 5.0))
            if let data = dataManager {
                header.titleLabel.text = data.categoryTitle[section]
            }
            return header
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let homeFirstCell = tableView.dequeueReusableCell(withIdentifier: C.homeFirstCell) as! RecommendationTableViewCell
            
            homeFirstCell.backgroundImage.image = UIImage(named: "poster2")
            return homeFirstCell
        } else  {
            let popularCell = tableView.dequeueReusableCell(withIdentifier: C.homeCommonCell) as! CommonTableViewCell
        
            popularCell.movieCollectionView.dataSource = self
            popularCell.movieCollectionView.delegate   = self
            
            if (indexPath.section == 4) {
                popularCell.layout.itemSize = CGSize(width: self.mainView.frame.width/2.5, height: 350)
            } else {
                popularCell.layout.itemSize = CGSize(width: self.mainView.frame.width/3.5, height: 150)
            }

            return popularCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            return 600
        } else if (indexPath.section == 4) {
            return 400
        } else {
            return 180
        }
    }
}

extension HomeDataSourceProvider:  UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: C.homeCollectionViewCell, for: indexPath) as! CommonCollectionViewCell
        if let data = dataManager {
            cell.movieImage.image = UIImage(named: data.moviePoster[indexPath.row])
        }
        return cell
    }
    
}
