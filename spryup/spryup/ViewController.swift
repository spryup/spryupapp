//
//  ViewController.swift
//  spryup
//
//  Created by Chamika Dharmasena on 7/29/18.
//  Copyright © 2018 spryup. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func createAccounttapped(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
              print("tried creating a user")
            if error != nil {
                print("error...\(error)")
            } else {
                print("user created")
                self.performSegue(withIdentifier: "createUserSegue", sender: nil)
            }
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            print("tried logging in")
            if error != nil{
                print("error..\(error)")
                } else {
                
                print("logged in")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
}

