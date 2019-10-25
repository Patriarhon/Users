//
//  UsersListUsersListInteractorIO.swift
//  Users
//
//  Created by Petr Kibukevich on 22/10/2019.
//  Copyright 2019 Petr. All rights reserved.
//

import Foundation
import RxRealm

protocol UsersListInteractorInterface: class {
    func getUsers()
    func addUsers(offset: Int)
    func moduleWillInactive()
}

protocol UsersListInteractorDelegate: class {
    func usersWereRecieved(users: [UsersListModel])
    func dataChanged(changes: RealmChangeset?, newDataSource: [UsersListModel])
}
