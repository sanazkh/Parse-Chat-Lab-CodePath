//
//  RegistrationViewController.swift
//  ParseChat
//
//  Created by Sanaz Khosravi on 9/19/18.
//  Copyright © 2018 GirlsWhoCode. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var password: UITextField!
    @IBOutlet var emailText: UITextField!
    @IBOutlet var userNameLabel: UITextField!
    @IBAction func registerButton(_ sender: Any) {
        let userName = userNameLabel.text
        let pass = password.text
        let email = emailText.text ?? ""
        
        if userName != "" && pass != ""{
            registerUser(userName!, pass!, email)
        }else{
            createAlert("Required Fields!", "Please fill in the blanks.")
        }
    }
    

    func registerUser(_ username : String, _ password : String, _ email : String) {
        // initialize a user object
        let newUser = PFUser()
        
        // set user properties
        let username1 = username
        let email1 = email
        let password1 = password
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                createAlert("Login Failed!", error.localizedDescription)
            } else {
                createAlert("Success!", "User Registered successfully")
            }
        }
    }
    
    func createAlert(_ title : String, _ message : String){
        let titleText = title
        let messageText = message
        let alert = UIAlertController(title: titleText, message:
            messageText, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler:nil))
        self.present(alert, animated: true, completion: nil)
    }

}
