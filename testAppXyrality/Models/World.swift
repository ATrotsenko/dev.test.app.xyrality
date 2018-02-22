//
//  World.swift
//  testAppXyrality
//
//  Created by Alexey Trotsenko on 22.02.2018.
//  Copyright © 2018 Alexey Trotsenko. All rights reserved.
//

import Foundation
import ObjectMapper


struct WorldStatus {
    var description: String
    var id: Int
}

class World: NSObject, Mappable  {
    
    var name    = ""
    var country = ""
    var id      = 0
    var language = ""
    var mapURL  = ""
    var URL     = ""
    var worldStatus = WorldStatus(description: "", id: 0)
    
    func mapping(map: Map) {
        
        name     <- map["name"]
        country  <- map["country"]
        id       <- map["id"]
        language <- map["language"]
        mapURL   <- map["mapURL"]
        URL      <- map["url"]
        
        var status: [String : Any]? = nil
        status <- map["worldStatus"]
        
        guard let description = status?["description"] as? String,
            let id = status?["id"] as? Int else {
            return
        }
        
        worldStatus = WorldStatus(description: description, id: id)
    }
    
    required init?(map: Map) {}
}



