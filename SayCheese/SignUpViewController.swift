//
//  SignUpViewController.swift
//  SayCheese
//
//  Created by vincent on 02/12/2016.
//  Copyright © 2016 kodappy. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var fullNameField: MainTextField!
    @IBOutlet weak var userNameField: MainTextField!
    @IBOutlet weak var emailField: MainTextField!
    @IBOutlet weak var passwordField: MainTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullNameField.delegate = self
        userNameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

// MARK: - Helpers Methods
private extension SignUpViewController {
    func signUp() {
        if let fullName = fullNameField.text, let userName = userNameField.text, let email = emailField.text, let password = passwordField.text {
            if !(fullName.isEmpty && userName.isEmpty && email.isEmpty && password.isEmpty) {
                // TODO - Try to create account
                let ws = WebService()
                ws.createUser(fullName: fullName, userName: userName, email: email, password: password, completionHandler: { (success, error) in
                    if let error = error {
                        DispatchQueue.main.sync {
                            self.displaySimpleAlert(withTitle: NSLocalizedString("error_title", comment: "Error Title Alert"), andMessage: error.message(), withCompletionHandler: {
                                self.fullNameField.becomeFirstResponder()
                            })
                        }
                        
                        return
                    }
                    
                    if success {
                        DispatchQueue.main.sync {
                            self.resetFields()
                            self.performSegue(withIdentifier: Segue.loggedIn, sender: self)
                        }
                    }
                })
            }
        }
    }
    
    func resetFields() {
        fullNameField.text = ""
        userNameField.text = ""
        emailField.text = ""
        passwordField.text = ""
    }
}

// MARK: - IBActions
extension SignUpViewController {
    @IBAction func signUp(sender: LoginButton) {
        signUp()
    }
}

// MARK: - UITextFieldDelegate
extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == fullNameField {
            userNameField.becomeFirstResponder()
        } else if textField == userNameField {
            emailField.becomeFirstResponder()
        } else if textField == emailField {
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            signUp()
        }
        
        return true
    }
}
