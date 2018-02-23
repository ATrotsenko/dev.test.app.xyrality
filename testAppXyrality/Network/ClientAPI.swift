//
//  APIClient.swift
//  testAppXyrality
//
//  Created by Alexey Trotsenko on 22.02.2018.
//  Copyright © 2018 Alexey Trotsenko. All rights reserved.
//

import Foundation
import Alamofire


typealias ResultBlock = ([World]?, Error?) -> ()

class APIClient: AbstractApiClient {
    static let shared = APIClient()
}

extension APIClient {
    
    static let kUserWorlds = "allAvailableWorlds"
    
    func getUserWorlds(_ login: String, pass: String, completion: @escaping ResultBlock) {
        
        let params = ["login" : login,
                      "password" : pass,
                      "deviceType" : Constants.Device.deviceType,
                      "deviceId" : Constants.Device.deviceUUID]
        
        self.loadObjects(Constants.URL.worldsURL, parameters: params, onResult: { (worlds) in
            
            
            
            
        }) { (error) in
            completion(nil, error)
        }
    }
    
}

