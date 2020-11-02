//
//  LoginViewController.swift
//  instagram
//
//  Created by Sambhav on 10/22/20.
//

import UIKit
import Parse


class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        
        // --- Copy this only
     /*
        let parseConfig = ParseClientConfiguration {
                $0.applicationId = "YdQGt0zz4cYY1jYos9zoPQzYgsBMVhW9BMLOTBW3" // <- UPDATE
                $0.clientKey = "oAIiaL8G6YJ5o3xBf8EWgFzSpa9gk2q9Ry4aQAbv" // <- UPDATE
                $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: parseConfig)
       */
        // --- end copy

        super.viewDidLoad()

        
    }
    

    @IBAction func onSignin(_ sender: Any) {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginsegue", sender: nil)
            } else {
                print("Error: \(error!.localizedDescription)")
            }
        }
    }
    
    @IBAction func onSignout(_ sender: Any) {
        
        var user = PFUser()
        user.username = usernameTextField.text
        user.password = passwordTextField.text
     
        
        user.signUpInBackground { (success, error) in
            if  success
            {
                self.performSegue(withIdentifier: "loginsegue", sender: nil)
            } else {
                print("Error: \(error!.localizedDescription)")
            }
        }

    }
    
}
