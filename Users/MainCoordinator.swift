//
//  MainCoordinator.swift
//  Users
//
//  Created by Petr on 22.10.2019.
//  Copyright © 2019 Petr. All rights reserved.
//

import UIKit

class MainCoordinator: NSObject {
    var window: UIWindow!
    
    lazy var navigationController: UINavigationController = {
        let navigation = UINavigationController()
//        navigation.setNavigationBarHidden(true, animated: false)
        navigation.viewControllers = [self.usersList.currentController()]
        return navigation
    }()
    
    lazy var usersList: UsersListHeader = {
        return UsersListHeader(root: self)
    }()
    
    lazy var userDetailed: UserDetailedHeader = {
        return UserDetailedHeader(root: self)
    }()
    
    func startCoordinatorWithWindow(_ window: UIWindow) {
        self.window = window
        self.window.rootViewController = navigationController
    }
}

extension MainCoordinator: UsersListDelegate {
    func showDetailedUser(with id: String) {
        userDetailed.setUserId(id: id)
        navigationController.pushViewController(userDetailed.currentController(), animated: true)
    }
}

extension MainCoordinator: UserDetailedDelegate {
    
}
