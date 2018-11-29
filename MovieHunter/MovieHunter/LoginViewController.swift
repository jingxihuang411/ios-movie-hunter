//
//  LoginViewController.swift
//  MovieHunter
//
//  Created by Jingxi Huang on 11/7/18.
//  Copyright © 2018 Jingxi Huang. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class LogInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    var userEmail = ""
    var userPassword = ""
    
    @IBAction func logInPressed(_ sender: UIButton) {
        guard let emailText = emailTextField.text else { return }
        guard let passwordText = passwordTextField.text else { return }
        
        if emailText == "" || passwordText == "" {
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields
            let alertController = UIAlertController(title: "Log In Error", message: "Please enter an email and password.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            Auth.auth().signIn(withEmail: emailText, password: passwordText, completion: { (user, error) in
                if let error = error {
                    let alertController = UIAlertController(title: "Log In Error", message:
                        error.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    self.performSegue(withIdentifier: "logInToMainPage", sender: self)
                }
            })
        }
    }
    
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        performSegue(withIdentifier:"logInToSignUp", sender: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    

    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "logInToMainPage", sender: self)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.emailTextField {
            if textField.text != nil {
                self.userEmail = textField.text!
            }
        } else {
            if textField.text != nil {
                self.userPassword = textField.text!
            }
        }
    }
}
