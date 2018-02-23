//
//  LoginViewController.swift
//  testAppXyrality
//
//  Created by Alexey Trotsenko on 22.02.2018.
//  Copyright © 2018 Alexey Trotsenko. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    let login = "ios.test@xyrality.com"
    let password = "password"
    
    var worlds = [World]()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserWorlds()
    }
    
    //MARK: - Private
    private func getUserWorlds() {
        APIClient.shared.getUserWorlds(login, pass: password) { (worlds, error) in
            if let error = error {
                return self.alertMessage(error.localizedDescription)
            }
        }
    }

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}

