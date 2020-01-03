//
//  GamerVCViewController.swift
//  PlayPokedex
//
//  Created by Salma on 12/10/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import UIKit

class GamerVC: UIViewController {
    
    @IBOutlet weak var gamerPDLabel: UILabel!
    @IBOutlet weak var gamerUsernameTextField: UITextField!
    @IBOutlet weak var gamerPasswordTextField: UITextField!

    @IBAction func playButton(_ sender: UIButton) {
        
        let username = gamerUsernameTextField.text
        let password = gamerPasswordTextField.text
        
        if username?.isEmpty == false && password?.isEmpty == false {
            performSegue(withIdentifier: "toPokemon", sender: nil)
        } else {
            print("Invalid Input")
        }

    }
    
override func viewDidLoad() {
        super.viewDidLoad()
     
    }

}
