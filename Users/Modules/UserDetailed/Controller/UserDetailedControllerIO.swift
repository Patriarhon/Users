//
//  UserDetailedUserDetailedControllerIO.swift
//  Users
//
//  Created by Petr Kibukevich on 22/10/2019.
//  Copyright 2019 Petr. All rights reserved.
//

import Foundation

protocol UserDetailedControllerInterface: class {
    func updateView(with user: UserDetailedModel)
}

protocol UserDetailedControllerDelegate: class {
    func didReadyToWork()
    func viewWillActive()
}
