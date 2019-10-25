//
//  UsersListUsersListInteractor.swift
//  Users
//
//  Created by Petr Kibukevich on 22/10/2019.
//  Copyright 2019 Petr. All rights reserved.
//

import Foundation
import RealmSwift
import RxRealm
import RxSwift

class UsersListInteractor: NSObject {
    weak var presenter: UsersListInteractorDelegate!
    
    private let realm = try! Realm()
    let bag = DisposeBag()
    var disposable: Disposable?
}

extension UsersListInteractor: UsersListInteractorInterface {
    func moduleWillInactive() {
        disposable?.dispose()
    }
    
    func getUsers() {
        getUsersFromRealm()
        NetworkManager.getUsers(offset: 0, success: { (response) in
            let responseUsers = response.members
            try? self.realm.write {
                self.realm.deleteAll()
                self.realm.add(responseUsers, update: .modified)
            }
        }) { (error) in
            print(error)
        }
    }
    
    func addUsers(offset: Int) {
        NetworkManager.getUsers(offset: offset, success: { (response) in
            let responseUsers = response.members
            try? self.realm.write {
                self.realm.add(responseUsers, update: .modified)
            }
        }) { (error) in
            print(error)
        }
    }
    
    private func startObserve(for users: Results<UserEntity> ) {
        disposable?.dispose()
        disposable = Observable.changeset(from: users).subscribe(onNext: { [unowned self] _, changes in
            self.presenter.dataChanged(changes: changes, newDataSource: self.modelArray() )
        })
        disposable?.disposed(by: bag)
    }
    
    private func getUsersFromRealm() {
        let realmUsers = self.realm.objects(UserEntity.self)
        startObserve(for: realmUsers)
        self.presenter.usersWereRecieved(users: modelArray())
    }
    
    private func modelArray() -> [UsersListModel] {
        let realmUsers = realm.objects(UserEntity.self)
        let users: [UserEntity] = realmUsers.map {$0}
        var userModels = [UsersListModel]()
        for userEntity in users {
            userModels.append(UsersListModel(userEntity: userEntity))
        }
        return userModels
    }
}
