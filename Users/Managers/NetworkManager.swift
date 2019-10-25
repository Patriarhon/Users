//
//  NetworkManager.swift
//  Users
//
//  Created by Petr on 22.10.2019.
//  Copyright © 2019 Petr. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    static let baseUrl = "https://open.rocket.chat/api/v1/"
    
    static func getUsers(offset: Int, success: @escaping (ServerResponse) -> Void, failure: @escaping (Error) -> Void) {
        let headers = ["X-User-Id": "e2qQQA3adTsZGN8et", "X-Auth-Token": "kc8AHBZlH3iCObf9alUrfpDkUoBAEsYoEEw3JBemQq3"]
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {                      // Задержка, необходимая по заданию для тестирования
            Alamofire.request(baseUrl + "channels.members?roomName=general", method: .get, parameters: ["offset": offset, "count": 20], headers: headers).responseJSON(completionHandler: { (response) in
                print(response)
                if let error = response.error {
                    failure(error)
                }
                guard let data = response.data else { return }
                do {
                    let myResponse = try JSONDecoder().decode(ServerResponse.self, from: data)
                    success(myResponse)
                }
                catch {
                    print("!!!!!!!!!!!")
                }
            })
        }
    }
}
