//
//  UserEntity.swift
//  Users
//
//  Created by Petr on 22.10.2019.
//  Copyright © 2019 Petr. All rights reserved.
//

import Foundation
import RealmSwift

class ServerResponse: Decodable {
    let members: [UserEntity]
}

class UserEntity: Object, Decodable {
    @objc dynamic var _id: String
    @objc dynamic var name: String?
    @objc dynamic var status: String?
    @objc dynamic var username: String?
    @objc dynamic var utcOffset: OptionalFloat?
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}

class OptionalFloat: Object, Decodable {
    private var numeric = RealmOptional<Float>()

    required public convenience init(from decoder: Decoder) throws {
        self.init()

        let singleValueContainer = try decoder.singleValueContainer()
        if singleValueContainer.decodeNil() == false {
            let value = try singleValueContainer.decode(Float.self)
            numeric = RealmOptional(value)
        }
    }

    var value: Float? {
        return numeric.value
    }

    var zeroOrValue: Float {
        return numeric.value ?? 0
    }
}
