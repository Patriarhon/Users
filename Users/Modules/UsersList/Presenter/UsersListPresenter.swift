//
//  UsersListUsersListPresenter.swift
//  Users
//
//  Created by Petr Kibukevich on 22/10/2019.
//  Copyright 2019 Petr. All rights reserved.
//

import Foundation
import RxRealm
import RxSwift

class UsersListPresenter: NSObject {
    weak var root: UsersListDelegate!
    weak var controller: UsersListControllerInterface!
    weak var interactor: UsersListInteractorInterface!
}

extension UsersListPresenter: UsersListInterface {
}

extension UsersListPresenter: UsersListControllerDelegate {
    func viewWillAppear() {
        interactor.getUsers()
    }
    
    func viewWillDisappear() {
        interactor.moduleWillInactive()
    }
    
    func didSelectUser(with id: String) {
        root.showDetailedUser(with: id)
    }
    
    func didShowLastItem(itemsCount: Int) {
        interactor.addUsers(offset: itemsCount)
    }
    
    func willUpdateView() {
        interactor.getUsers()
    }
    
    func didReadyToWork() {
    }
}

extension UsersListPresenter: UsersListInteractorDelegate {
    func dataChanged(changes: RealmChangeset?, newDataSource: [UsersListModel]) {
        controller.updateView(with: changes, model: newDataSource)
    }
    
    func usersWereRecieved(users: [UsersListModel]) {
        controller.updateView(with: users)
    }
}
