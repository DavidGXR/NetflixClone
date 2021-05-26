//
//  SearchVC.swift
//  NetflixClone
//
//  Created by David Im on 14/4/21.
//

import UIKit

class SearchVC: UIViewController {

    private var sc = UISearchController(searchResultsController: nil)
    private var tableView:UITableView!
    private var dataManager = SearchDataManager()
    private lazy var searchDataSourceProvider = SearchDataSourceProvider(dataManager: dataManager)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
        
    private func setupViews() {
        setupSearchController()
        setupTableView()
    }
    
    private func setupSearchController() {
        navigationItem.searchController = sc
        navigationItem.hidesSearchBarWhenScrolling = false
        sc.obscuresBackgroundDuringPresentation = false
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: CGRect.zero, style: .grouped)
        self.view.addSubview(tableView)
        // register cell
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "searchCell")
        // constraint
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 80
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        // datasource & delegate
        tableView.dataSource = searchDataSourceProvider
        tableView.delegate   = searchDataSourceProvider
        // style
        tableView.separatorStyle = .none
        tableView.backgroundColor = .black
        tableView.indicatorStyle = .white
        tableView.showsVerticalScrollIndicator = true
        let searchTableViewHeader = SearchTableViewHeader(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 20))
        tableView.tableHeaderView = searchTableViewHeader
    }

}

