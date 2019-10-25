//
//  UserDetailedUserDetailedViewController.swift
//  Users
//
//  Created by Petr Kibukevich on 22/10/2019.
//  Copyright 2019 Petr. All rights reserved.
//

import UIKit

class UserDetailedViewController: UIViewController {

    weak var presenter: UserDetailedControllerDelegate!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var user: UserDetailedModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "User"
        
        avatarImageView.layer.cornerRadius = 40
        avatarImageView.layer.masksToBounds = true
        tableView.dataSource = self
        
        presenter.didReadyToWork()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillActive()
    }
}

extension UserDetailedViewController: UserDetailedControllerInterface {
    func updateView(with user: UserDetailedModel) {
        self.user = user

        nameLabel.text = user.name ?? ""
        avatarImageView.kf.indicatorType = .activity
        avatarImageView.kf.setImage(with: user.avatar)
        
        tableView.reloadData()
    }
}

extension UserDetailedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user?.userInfo.keys.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: "UserDetailedCell"), for: indexPath)
        if let user = user {
            let key = Array(user.userInfo.keys)[indexPath.row]
            cell.textLabel?.text = key
            cell.detailTextLabel?.text = user.userInfo[key]
        }
        return cell
    }
    
    
}
