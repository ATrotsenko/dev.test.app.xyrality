//
//  APIClient.swift
//  testAppXyrality
//
//  Created by Alexey Trotsenko on 22.02.2018.
//  Copyright © 2018 Alexey Trotsenko. All rights reserved.
//

import Foundation
import Alamofire


class APIClient: AbstractApiClient {
    static let shared = APIClient()
    let kUserWorlds = "allAvailableWorlds"

}

extension APIClient {
    
    func getUserWorlds(_ login: String,
                       pass: String,
                       onResult: @escaping (_ result: [World]) -> (),
                       onError: @escaping (_ error: Error) -> ()) {
        
        let params = ["login" : login,
                      "password" : pass,
                      "deviceType" : Constants.Device.deviceType,
                      "deviceId" : Constants.Device.deviceUUID]
        
        self.loadObjects(Constants.URL.worldsURL, parameters: params, onResult: { (json) in
            
            guard let worldsJSON = json?[self.kUserWorlds] as? [AnyDict] else {
                return onError(CustomError.deserializationError)
            }
            
            //Map objects from json array
            var worlds = [World]()
            for world in worldsJSON {
                guard let world = World(JSON: world) else {
                    return onError(CustomError.deserializationError)
                }
                worlds.append(world)
            }
            if worlds.isEmpty {
                return onError(CustomError.dataEmpty)
            }
            onResult(worlds)

        }) { (error) in
            onError(error)
        }
    }
    
}

