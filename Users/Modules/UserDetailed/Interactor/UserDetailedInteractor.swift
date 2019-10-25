//
//  UserDetailedUserDetailedInteractor.swift
//  Users
//
//  Created by Petr Kibukevich on 22/10/2019.
//  Copyright 2019 Petr. All rights reserved.
//

import Foundation
import RealmSwift
import RxRealm
import RxSwift

class UserDetailedInteractor: NSObject {
    weak var presenter: UserDetailedInteractorDelegate!
    
    private let realm = try! Realm()
}

extension UserDetailedInteractor: UserDetailedInteractorInterface {
    func getUser(id: String) {
        if let userEntity = realm.object(ofType: UserEntity.self, forPrimaryKey: id) {
            let user = UserDetailedModel(userEntity: userEntity)
            presenter.wasReceived(user: user)
        }
    }
}
