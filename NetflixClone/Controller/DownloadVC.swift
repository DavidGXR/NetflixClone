//
//  DownloadVC.swift
//  NetflixClone
//
//  Created by David Im on 14/4/21.
//

import UIKit

class DownloadVC: UIViewController {

    private var tableView:UITableView!
    private var myDownloadBarItem = UIBarButtonItem()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    private func setupViews() {
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        let customRightBarItems = RightBarItems(frame: CGRect.zero)
        let rightBarItem = UIBarButtonItem(customView: customRightBarItems)
        myDownloadBarItem.title = "My Downloads"
        myDownloadBarItem.tintColor = .white
        let strAttribute = [NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 22.0)!]
        myDownloadBarItem.setTitleTextAttributes(strAttribute, for: .normal)
        self.navigationItem.leftBarButtonItem   = myDownloadBarItem
        self.navigationItem.rightBarButtonItem  = rightBarItem
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: CGRect.zero, style: .grouped)
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate  = self
        tableView.rowHeight = 420
        tableView.separatorStyle = .none
        tableView.backgroundColor = .black
        tableView.register(DownloadTableViewCell.self, forCellReuseIdentifier: "myDownloadCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        let downloadTableViewHeader = DownloadTableViewHeader(frame: CGRect(x: 0, y: 0, width: 0, height: 40))
        tableView.tableHeaderView = downloadTableViewHeader
    }
}

extension DownloadVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
            
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myDownloadCell") as! DownloadTableViewCell
        
        return cell
    }
}
