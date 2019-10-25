//
//  UserDetailedUserDetailedPresenter.swift
//  Users
//
//  Created by Petr Kibukevich on 22/10/2019.
//  Copyright 2019 Petr. All rights reserved.
//

import Foundation

class UserDetailedPresenter: NSObject {
    weak var root: UserDetailedDelegate!
    weak var controller: UserDetailedControllerInterface!
    weak var interactor: UserDetailedInteractorInterface!
    
    var userId = ""
}

extension UserDetailedPresenter: UserDetailedInterface {
    func setUserId(id: String) {
        userId = id
    }
}

extension UserDetailedPresenter: UserDetailedControllerDelegate {
    func viewWillActive() {
        interactor.getUser(id: userId)
    }
    
    func didReadyToWork() {
        
    }
}

extension UserDetailedPresenter: UserDetailedInteractorDelegate {
    func wasReceived(user: UserDetailedModel) {
        controller.updateView(with: user)
    }
}
