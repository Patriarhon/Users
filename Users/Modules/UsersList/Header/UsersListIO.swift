//
//  UsersListUsersListIO.swift
//  Users
//
//  Created by Petr Kibukevich on 22/10/2019.
//  Copyright 2019 Petr. All rights reserved.
//

import Foundation

protocol UsersListInterface: class {
    
}

protocol UsersListDelegate: class {
    func showDetailedUser(with id: String)
}
