//
//  UserDetailedUserDetailedHeader.swift
//  Users
//
//  Created by Petr Kibukevich on 22/10/2019.
//  Copyright 2019 Petr. All rights reserved.
//

import UIKit

class UserDetailedHeader: NSObject {

    var controller: UserDetailedViewController!
    var presenter: UserDetailedPresenter!
    var interactor: UserDetailedInteractor!
    
    init(root: UserDetailedDelegate) {
        super.init()
        
        controller = moduleController()
        presenter = UserDetailedPresenter()
        interactor = UserDetailedInteractor()
        
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
    
    private func moduleController() -> UserDetailedViewController {
        return moduleStoryboard().instantiateViewController(withIdentifier: "UserDetailedViewController") as! UserDetailedViewController
    }
    
    private func moduleStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "UserDetailed", bundle: nil)
    }
}

extension UserDetailedHeader: UserDetailedInterface {
    func setUserId(id: String) {
        presenter.setUserId(id: id)
    }
}
