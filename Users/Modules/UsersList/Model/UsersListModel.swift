//
//  UsersListUsersListModel.swift
//  Users
//
//  Created by Petr Kibukevich on 22/10/2019.
//  Copyright 2019 Petr. All rights reserved.
//

import Foundation

//class UsersListModel: NSObject {
//    var users = [UserCellModel]()
//}

class UsersListModel: NSObject {
    var id: String
    var name: String?
    var avatarUrl: URL?
    
    init(userEntity:UserEntity) {
        id = userEntity._id
        super.init()
        name = userEntity.name
        if let userName = userEntity.username {
            avatarUrl = URL(string: "https://open.rocket.chat/avatar/\(userName)?format=jpeg")
        }
        
    }
}
