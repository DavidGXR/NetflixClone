//
//  HomeVC.swift
//  NetflixClone
//
//  Created by David Im on 11/4/21.
//

import UIKit

class HomeVC: UIViewController {
    
    let tableView = UITableView()
    
    let categoryTitle = ["Popular on Netflix", "Trending Now", "TV Dramas", "Netflix Originals", "US TV Shows", "Western Movies", "Comedies", "Anime", "Recently Added", "TV Sci-Fi & Horror", "Action Movies"]
    let moviePoster = ["poster", "poster1", "poster3", "poster4", "poster5", "poster6", "poster7", "poster8"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = .black
        self.navigationController?.navigationBar.isHidden = true
        setupTabBar()
        setupTableView()
    }
        
    private func setupTabBar() {
        let icon = ["house", "play.rectangle", "magnifyingglass", "icloud.and.arrow.down"]
        for i in 0...3 {
            self.tabBarController?.tabBar.items![i].image = UIImage(systemName: icon[i])
        }
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.contentInsetAdjustmentBehavior = .never // allow cell to stay under status bar
        // constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        // register
        tableView.register(RecommendationTableViewCell.self, forCellReuseIdentifier: "homeFirstCell")
        tableView.register(CommonTableViewCell.self, forCellReuseIdentifier: "commonCell")
    }

}

//MARK: - TableView
extension HomeVC: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let homeFirstCell = tableView.dequeueReusableCell(withIdentifier: "homeFirstCell") as! RecommendationTableViewCell
            homeFirstCell.backgroundImage.image = UIImage(named: "poster1")
        
            return homeFirstCell
        } else  {
            let popularCell = tableView.dequeueReusableCell(withIdentifier: "commonCell") as! CommonTableViewCell
        
            popularCell.backgroundColor = .black
            popularCell.titleLabel.text = categoryTitle[indexPath.section-1]
            popularCell.movieCollectionView.dataSource = self
            popularCell.movieCollectionView.delegate   = self
            
            if (indexPath.section == 4) {
                popularCell.layout.itemSize = CGSize(width: self.view.frame.width/2.5, height: 350)
            } else {
                popularCell.layout.itemSize = CGSize(width: self.view.frame.width/3.5, height: 150)
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
            return 200
        }
    }
}

//MARK: - CollectionView
extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! CommonCollectionViewCell
        cell.movieImage.image = UIImage(named: moviePoster[indexPath.row])
    
        return cell
    }
    
    
}
