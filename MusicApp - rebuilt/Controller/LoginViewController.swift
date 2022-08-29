//
//  LoginViewController.swift
//  MusicApp - rebuilt
//
//  Created by Muskan on 20/06/22.
//
/*

import UIKit
//import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordText: UITextField!
  //  @IBOutlet weak var background: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

     //   view.addSubview(background)
        view.addSubview(emailText)
        view.addSubview(passwordText)
        view.addSubview(loginButton)
       // background.image = .init(named: "back2")
       // background.contentMode = .scaleToFill
        
    }

    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailText.text , let password = passwordText.text{
            
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error  in
              
                if error != nil{
                    
                    var alert = UIAlertController()
                    var action = UIAlertAction()
                    alert = .init(title: "", message: "Error logging In", preferredStyle: .alert)
                    action = .init(title: "OK", style: .default, handler: { (action) in
                        print("OK pressed.")
                    })
                    alert.addAction(action)
                    self!.present(alert, animated: true, completion: nil)
                    
                }else{
                    self!.performSegue(withIdentifier: "logIn", sender: self)
                }
                
            }
            
        }
        
        
        
    }
    
}
*/
