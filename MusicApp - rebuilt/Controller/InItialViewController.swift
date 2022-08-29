//
//  InItialViewController.swift
//  MusicApp - rebuilt
//
//  Created by Muskan on 20/06/22.
//

import UIKit

class InItialViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(loginButton)
        view.addSubview(signupButton)
        
    }
    

}
