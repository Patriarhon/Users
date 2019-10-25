//
//  UsersListUsersListViewController.swift
//  Users
//
//  Created by Petr Kibukevich on 22/10/2019.
//  Copyright 2019 Petr. All rights reserved.
//

import UIKit
import RxRealm

class UsersListViewController: UIViewController {

    weak var presenter: UsersListControllerDelegate!
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = [UsersListModel]()
    
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style:.plain, target:nil, action:nil)
        self.title = "Users"
        
        tableView.dataSource = self
        tableView.delegate = self
        let cellIdentefier = String(describing: UserTableViewCell.self)
        tableView.register(UINib(nibName: cellIdentefier, bundle: nil), forCellReuseIdentifier: cellIdentefier)
        tableView.tableFooterView = UIView()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
        presenter.didReadyToWork()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        presenter.viewWillDisappear()
    }
    
    @objc private func refreshData() {
        presenter.willUpdateView()
    }
}

//MARK: - UsersListControllerInterface

extension UsersListViewController: UsersListControllerInterface {
    func updateView(with changes: RealmChangeset?, model: [UsersListModel]) {
        data = model
        
        if let changes = changes {
            self.tableView.applyChangeset(changes)
        }
    }
    
    func updateView(with model: [UsersListModel]) {
        data = model
        refreshControl.endRefreshing()
    }
    

}

//MARK: - UITableViewDataSource

extension UsersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UserTableViewCell.self), for: indexPath) as! UserTableViewCell
        cell.configure(with: data[indexPath.row])
        
        if indexPath.row == data.count - 1 {
            presenter.didShowLastItem(itemsCount: data.count)
        }
        return cell
    }
}

//MARK: - UITableViewDelegate

extension UsersListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectUser(with: data[indexPath.row].id)
    }
}

//MARK: - UITableView + applyChangeset(_ changes: RealmChangeset)

extension UITableView {
    func applyChangeset(_ changes: RealmChangeset) {
        beginUpdates()
        deleteRows(at: changes.deleted.map { IndexPath(row: $0, section: 0) }, with: .automatic)
        insertRows(at: changes.inserted.map { IndexPath(row: $0, section: 0) }, with: .automatic)
        reloadRows(at: changes.updated.map { IndexPath(row: $0, section: 0) }, with: .automatic)
        endUpdates()
    }
}
