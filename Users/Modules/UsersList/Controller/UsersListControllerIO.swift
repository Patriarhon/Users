//
//  UsersListUsersListControllerIO.swift
//  Users
//
//  Created by Petr Kibukevich on 22/10/2019.
//  Copyright 2019 Petr. All rights reserved.
//

import Foundation
import RxRealm

protocol UsersListControllerInterface: class {
    func updateView(with model: [UsersListModel])
    func updateView(with changes: RealmChangeset?, model: [UsersListModel])
}

protocol UsersListControllerDelegate: class {
    func didReadyToWork()
    func willUpdateView()
    func didShowLastItem(itemsCount: Int)
    func didSelectUser(with id: String)
    func viewWillDisappear()
    func viewWillAppear()
}
