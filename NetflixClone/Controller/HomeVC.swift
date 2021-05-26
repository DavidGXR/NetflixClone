//
//  HomeVC.swift
//  NetflixClone
//
//  Created by David Im on 11/4/21.
//

import UIKit

class HomeVC: UIViewController {
    
    private var tableView:UITableView!
    private var rightBarItem:UIBarButtonItem!
    private var leftBarItem:UIBarButtonItem!
    private var homeDataManager = HomeDataManager()
    private lazy var homeDataSourceProvider = HomeDataSourceProvider(dataManager: homeDataManager, view: self.view)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
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
        tableView = UITableView(frame: CGRect.zero, style: .grouped)
        self.tableView.backgroundColor = .black
        view.addSubview(tableView)
        // datasource & delegate
        tableView.delegate = homeDataSourceProvider
        tableView.dataSource = homeDataSourceProvider
        // style
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

