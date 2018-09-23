//
//  RegistrationViewController.swift
//  ParseChat
//
//  Created by Sanaz Khosravi on 9/19/18.
//  Copyright © 2018 GirlsWhoCode. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD

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
            MBProgressHUD.showAdded(to: self.view, animated: true)
            registerUser(userName!, pass!, email)
        }else{
            createAlert("Required Fields!", "Please fill in the blanks.")
        }
    }
    

    func registerUser(_ username : String, _ password : String, _ email : String) {
        // initialize a user object
        let newUser = PFUser()
        
        // set user properties
        newUser.email = email
        newUser.username = username
        newUser.password = password
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                MBProgressHUD.hide(for: self.view, animated: true)
                self.createAlert("Login Failed!", error.localizedDescription)
            } else {
                MBProgressHUD.hide(for: self.view, animated: true)
                self.createAlert("Success!", "User Registered successfully")
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
