//
//  BaseViewController.swift
//  testAppXyrality
//
//  Created by Alexey Trotsenko on 23.02.2018.
//  Copyright © 2018 Alexey Trotsenko. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    
    // MARK: - Alert Messaging
    func alertMessage(_ message: String, completion: EmptyBlock? = nil) {
        let alertController = UIAlertController(title: "Information", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { (_) in
            completion?()
        }
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
