//
//  ViewController.swift
//  ParseChat
//
//  Created by Sanaz Khosravi on 9/19/18.
//  Copyright © 2018 GirlsWhoCode. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var passWord: UITextField!
    @IBOutlet var userName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func loginButton(_ sender: Any) {
        let username = usernameLabel.text ?? ""
        let password = passwordLabel.text ?? ""
        if username != "" && password != ""{
            loginUser(username, password)
        }else{
            createAlert("Required Fields!", "Please fill in the blanks.")
        }
    }
    
    func loginUser(_ username : String, _ password : String) {
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                createAlert("Login Failed!", error.localizedDescription)
            } else {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
    
    func createAlert(_ title : String, _ message : String){
        var titleText = title
        var messageText = message
        let alert = UIAlertController(title: titleText, message:
            messageText, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler:nil))
        self.present(alert, animated: true, completion: nil)
    }
}

