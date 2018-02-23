//
//  Constants.swift
//  testAppXyrality
//
//  Created by Alexey Trotsenko on 22.02.2018.
//  Copyright © 2018 Alexey Trotsenko. All rights reserved.
//

import Foundation
import UIKit

typealias EmptyBlock = ()->()
typealias WorldsResultBlock = ([World]?, Error?) -> ()
typealias AnyDict = [String : Any]

// Constants
struct Constants {
    enum URL {
        static let worldsURL = "http://backend1.lordsandknights.com/XYRALITY/WebObjects/BKLoginServer.woa/wa/worlds"
    }
    
    enum Device {
        static var deviceType: String {
            let device = UIDevice.current
            return device.model + " " + device.systemName + " " + device.systemVersion
        }
        
        static var deviceUUID: String {
            return NSUUID().uuidString
        }
    }
}
