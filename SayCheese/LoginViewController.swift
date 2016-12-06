//
//  LoginViewController.swift
//  SayCheese
//
//  Created by vincent on 01/12/2016.
//  Copyright © 2016 kodappy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameField.delegate = self
        passwordField.delegate = self
        
        print("\(usernameField.text) || \(passwordField.text)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - Helpers Functions
private extension LoginViewController {
    func login() {
        if let username = usernameField.text, let password = passwordField.text {
            if !(username.isEmpty && password.isEmpty) {
                let ws = WebService()
                
                // Trying to login.
                ws.login(username: username, password: password, hashPassword: true, completionHandler: { (success, error) in
                    if success {
                        DispatchQueue.main.sync {
                            self.performSegue(withIdentifier: Segue.loggedIn, sender: self)
                        }
                    } else {
                        if let error = error {
                            DispatchQueue.main.sync {
                                self.displaySimpleAlert(withTitle: NSLocalizedString("error_title", comment: "Error Title Alert"), andMessage: error.message())
                            }
                        }
                    }
                })
            }
        }
    }
}

// MARK: - IBActions
extension LoginViewController {
    @IBAction func loginTapped(sender: UIButton) {
        login()
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField {
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            login()
        }
        
        return true
    }
}
