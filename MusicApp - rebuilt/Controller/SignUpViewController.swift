//
//  SignUpViewController.swift
//  MusicApp - rebuilt
//
//  Created by Muskan on 20/06/22.
//
/*

import UIKit
//import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var signButton: UIButton!
   // @IBOutlet weak var background: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        view.addSubview(background)
        view.addSubview(emailText)
        view.addSubview(passwordText)
        view.addSubview(signButton)
        
      //  background.image = .init(named: "back1")
       // background.contentMode = .scaleToFill
        

    }
    
    @IBAction func signupPressed(_ sender: UIButton) {
        
        if let email = emailText.text , let password = passwordText.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if error != nil{
                    var alert = UIAlertController()
                    var action  = UIAlertAction()
                    alert = .init(title: "", message: "Sign Up Error", preferredStyle: .alert)
                    action = .init(title: "OK", style: .default, handler: { (action) in
                        print("Ok pressed - signUp")
                    })
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }else{
                    self.performSegue(withIdentifier: "signup", sender: self)
                }
            }
        }
        
    }
    

}
*/
