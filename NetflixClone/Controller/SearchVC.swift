//
//  SearchVC.swift
//  NetflixClone
//
//  Created by David Im on 14/4/21.
//

import UIKit

class SearchVC: UIViewController {

    var sc = UISearchController(searchResultsController: nil)
    var tableView:UITableView!
    
    let moviePoster = ["poster", "poster1", "poster2", "poster3", "poster4", "poster5", "poster6", "poster7", "poster8"]
    let movieTitle = ["Shadow of The Moon", "Captain Marvel", "Fast and Furious", "Night School", "Dragon", "Wonder Park", "Sea Thives", "London has Fallen", "Fast and Furious 6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
        
    private func setupViews() {
        tableView = UITableView(frame: CGRect.zero, style: .grouped)
        self.view.addSubview(tableView)
        
        navigationItem.searchController = sc
        navigationItem.hidesSearchBarWhenScrolling = false
        sc.obscuresBackgroundDuringPresentation = false
    
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .black
        tableView.indicatorStyle = .white
        tableView.showsVerticalScrollIndicator = true
        
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "searchCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 80
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }

}

extension SearchVC:UITableViewDataSource, UITableViewDelegate {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let titleLabel = UILabel()
        headerView.addSubview(titleLabel)
        headerView.backgroundColor = .black
        titleLabel.text = "Top Searches"
        titleLabel.font = UIFont(name: "Helvetica-Bold", size: 17)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 5).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchCell = tableView.dequeueReusableCell(withIdentifier: "searchCell") as! SearchTableViewCell
        searchCell.movieThumbnail.image = UIImage(named: moviePoster[indexPath.row])
        searchCell.titleLabel.text = movieTitle[indexPath.row]
        
        return searchCell
    }
    
    
}
