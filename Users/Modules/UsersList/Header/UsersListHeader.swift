//
//  UsersListUsersListHeader.swift
//  Users
//
//  Created by Petr Kibukevich on 22/10/2019.
//  Copyright 2019 Petr. All rights reserved.
//

import UIKit

class UsersListHeader: NSObject {

    var controller: UsersListViewController!
    var presenter: UsersListPresenter!
    var interactor: UsersListInteractor!
    
    init(root: UsersListDelegate) {
        super.init()
        
        controller = moduleController()
        presenter = UsersListPresenter()
        interactor = UsersListInteractor()
        
        presenter.root = root
        presenter.controller = controller
        presenter.interactor = interactor
        
        controller.presenter = presenter
        interactor.presenter = presenter
    }
    
    func currentController() -> UIViewController {
        return controller
    }

    //MARK: - private
    
    private func moduleController() -> UsersListViewController {
        return moduleStoryboard().instantiateViewController(withIdentifier: "UsersListViewController") as! UsersListViewController
    }
    
    private func moduleStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "UsersList", bundle: nil)
    }
}

extension UsersListHeader: UsersListInterface {

}
