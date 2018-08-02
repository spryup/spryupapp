//
//  landingViewController.swift
//  spryup
//
//  Created by Chamika Dharmasena on 7/31/18.
//  Copyright © 2018 spryup. All rights reserved.
//

import UIKit
import Firebase

class landingViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordtextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }


    @IBAction func loginButtonTapped(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordtextField.text!) { (user, error) in
            print("tried logging in")
            if error != nil{
                print("error..\(error)")
            } else {
                
                print("logged in")
                self.performSegue(withIdentifier: "logIntoProfileSegue", sender: nil)
            }
        }
        
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "createAccountSegue", sender: nil)
        
    }
    
   

}
