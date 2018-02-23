//
//  AbstractApiClient.swift
//  testAppXyrality
//
//  Created by Alexey Trotsenko on 22.02.2018.
//  Copyright © 2018 Alexey Trotsenko. All rights reserved.
//

import Foundation
import Alamofire


enum CustomError: Error {
    case serverConection
    case deserializationError
    case dataEmpty
    
    var localizedDescription: String {
        switch self {
        case .serverConection: return "No internet connection"
        case .deserializationError: return "Desirelization Error"
        case .dataEmpty: return "Data Empty"
        }
    }
}

class AbstractApiClient: NSObject {
    
    
    public func loadObjects(_ url: String,
                            method: HTTPMethod = .post,
                            parameters: AnyDict? = nil,
                            onResult: @escaping (_ result: AnyDict?) -> (),
                            onError: @escaping (_ error: Error) -> ()) {
        
        Alamofire.request(url, method: method, parameters: parameters).responsePropertyList { (response) in
            
            switch response.result {
            case .failure:
                onError(CustomError.serverConection)
                
            case .success(let propertyList):
            // Make data from property list
            guard let jsonData = try? JSONSerialization.data(withJSONObject: propertyList, options: .prettyPrinted) else {
                return onError(CustomError.deserializationError)
            }
            // Make json from data
            guard let json = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? AnyDict else {
                return onError(CustomError.deserializationError)
            }
            onResult(json)
            }
        }
    }
}
