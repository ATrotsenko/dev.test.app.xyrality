//
//  LoginViewController.swift
//  testAppXyrality
//
//  Created by Alexey Trotsenko on 22.02.2018.
//  Copyright © 2018 Alexey Trotsenko. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let login = "ios.test@xyrality.com"
    let password = "password"
    
    let segueIdentifire = "ShowWorlds"
    var worlds = [World]()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.text = login
        passwordTextField.text = password
    }
    
    
    //MARK: - Private
    private func loginUser(_ login: String, _ password: String) {
        APIClient.shared.getUserWorlds(login, pass: password) { (worlds, error) in
            if let error = error {
                return self.alertMessage(error.localizedDescription)
            }
            self.worlds = worlds!
            self.performSegue(withIdentifier: self.segueIdentifire, sender: nil)
        }
    }

    //MARK: - IBActions
    @IBAction func loginAction(_ sender: Any) {
        guard let login = loginTextField.text,
            let password = passwordTextField.text else {
                return alertMessage("Please enter all fields")
        }
        loginUser(login, password)
    }
    
     // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = segue.destination as? WorldsViewController else {return}
        controller.worlds = worlds
     }
    

}

