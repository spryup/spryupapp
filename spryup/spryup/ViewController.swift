//
//  ViewController.swift
//  spryup
//
//  Created by Chamika Dharmasena on 7/29/18.
//  Copyright © 2018 spryup. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


class ViewController: UIViewController{
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        


    }

    @IBAction func createAccounttapped(_ sender: Any) {
        
        let email = emailTextField.text!
        let name = nameTextField.text!
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
              print("tried creating a user")
            if error != nil {
                print("error...\(error)")
            } else {
                print("user created")
                
                var ref: DatabaseReference!
                ref = Database.database().reference(fromURL: "https://spryup-7c17d.firebaseio.com/")
                let values = ["name": name , "email": email]
                ref.updateChildValues(values, withCompletionBlock: { (err, ref) in
                    
                    if err != nil {
                        print(err)
                        return
                    }
                    print("user saved ")
                })
                
                self.performSegue(withIdentifier: "gotoMain", sender: nil)
            }
        }
    }
    

        
//        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
//            print("tried logging in")
//            if error != nil{
//                print("error..\(error)")
//                } else {
//
//                print("logged in")
//                self.performSegue(withIdentifier: "loginSegue", sender: nil)
//            }
//        }
    
}

