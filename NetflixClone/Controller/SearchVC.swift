//
//  SearchVC.swift
//  NetflixClone
//
//  Created by David Im on 14/4/21.
//

import UIKit

class SearchVC: UIViewController {

    var sc = UISearchController(searchResultsController: nil)
    let tableView = UITableView()
    let topSearchLabel = UILabel()
    
    let moviePoster = ["poster", "poster1", "poster2", "poster3", "poster4", "poster5", "poster6", "poster7", "poster8"]
    let movieTitle = ["Shadow of The Moon", "Captain Marvel", "Fast and Furious", "Night School", "Dragon", "Wonder Park", "Sea Thives", "London has Fallen", "Fast and Furious 6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
        
    private func setupViews() {
        self.view.addSubview(tableView)
        self.view.addSubview(topSearchLabel)
        
        navigationItem.searchController = sc
        navigationItem.hidesSearchBarWhenScrolling = false
        sc.obscuresBackgroundDuringPresentation = false
    
        topSearchLabel.font = UIFont(name: "Helvetica-Bold", size: 17)
        topSearchLabel.text = "Top Searches"
        topSearchLabel.textColor = .white
        topSearchLabel.translatesAutoresizingMaskIntoConstraints = false
        topSearchLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        topSearchLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        topSearchLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        topSearchLabel.bottomAnchor.constraint(equalTo: self.tableView.topAnchor, constant: 0).isActive = true

        //tableView.tableHeaderView = topSearchLabel
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .black
        tableView.indicatorStyle = .white
        tableView.showsVerticalScrollIndicator = true
        
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "searchCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 80
        tableView.topAnchor.constraint(equalTo: self.topSearchLabel.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }

}

extension SearchVC:UITableViewDataSource, UITableViewDelegate {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchCell = tableView.dequeueReusableCell(withIdentifier: "searchCell") as! SearchTableViewCell
        searchCell.movieThumbnail.image = UIImage(named: moviePoster[indexPath.row])
        searchCell.titleLabel.text = movieTitle[indexPath.row]
        
        return searchCell
    }
    
    
}
