//
//  ComingSoonVC.swift
//  NetflixClone
//
//  Created by David Im on 14/4/21.
//

import UIKit
import AVKit
import AVFoundation

class ComingSoonVC: UIViewController, AVPlayerViewControllerDelegate {

    private var tableView:UITableView!
    private var comingSoonBarItem = UIBarButtonItem()
    private var rightBarItem:UIBarButtonItem!
    private var headerView:ComingSoonTableViewHeader!
    private let comingSoonTableView = ComingSoonTableViewCell()
    private var comingSoonDataManager = ComingSoonDataManager()
    private lazy var comingSoonDataSourceProvider = ComingSoonDataSourceProvider(dataManager: comingSoonDataManager)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupTableView()
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        print("viewWillDisappear get called..!")
//
//        player.pause()
//        player.replaceCurrentItem(with: nil)
//    }

    private func setupNavigationBar() {
        let customRightBarItems = RightBarItems(frame: CGRect.zero)
        let rightBarItem = UIBarButtonItem(customView: customRightBarItems)
        comingSoonBarItem.title = "Coming Soon"
        comingSoonBarItem.tintColor = .white
        let strAttribute = [NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 22.0)!]
        comingSoonBarItem.setTitleTextAttributes(strAttribute, for: .normal)
        self.navigationItem.leftBarButtonItem   = comingSoonBarItem
        self.navigationItem.rightBarButtonItem  = rightBarItem
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: CGRect.zero, style: .grouped)
        self.view.addSubview(tableView)
        // constraint
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        headerView = ComingSoonTableViewHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
        tableView.tableHeaderView = headerView
        // datasource & delegate
        tableView.dataSource = comingSoonDataSourceProvider
        tableView.delegate  = comingSoonDataSourceProvider
        // cell
        tableView.register(ComingSoonTableViewCell.self, forCellReuseIdentifier: "comingSoonCell")
        //style
        tableView.rowHeight = 420
        tableView.separatorStyle = .none
        tableView.backgroundColor = .black
    }
}

