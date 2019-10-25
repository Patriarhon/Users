//
//  UserDetailedUserDetailedInteractorIO.swift
//  Users
//
//  Created by Petr Kibukevich on 22/10/2019.
//  Copyright 2019 Petr. All rights reserved.
//

import Foundation

protocol UserDetailedInteractorInterface: class {
    func getUser(id: String)
}

protocol UserDetailedInteractorDelegate: class {
    func wasReceived(user: UserDetailedModel)
}
