//
//  UserDetailedUserDetailedModel.swift
//  Users
//
//  Created by Petr Kibukevich on 22/10/2019.
//  Copyright 2019 Petr. All rights reserved.
//

import Foundation

class UserDetailedModel: NSObject {
    var avatar: URL?
    var name: String?
    
    var userInfo = [String: String]()
    
    init(userEntity: UserEntity) {
        super.init()
        name = userEntity.name
        if let userName = userEntity.username {
            avatar = URL(string: "https://open.rocket.chat/avatar/\(userName)?format=jpeg")
            userInfo["userName"] = userName
        }
        
        if let status = userEntity.status {
            userInfo["status"] = status
        }
        
        if let utcOffsetFloat = userEntity.utcOffset {
            let utcOffset = String(utcOffsetFloat.zeroOrValue)
            userInfo["utcOffset"] = utcOffset
        }
    }
}
