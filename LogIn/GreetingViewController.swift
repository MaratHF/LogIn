//
//  GreetingViewController.swift
//  LogIn
//
//  Created by MAC  on 09.03.2022.
//

import UIKit

class GreetingViewController: UIViewController {

    @IBOutlet var greetingLabel: UILabel!
    
    var welcomeMessage: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greetingLabel.text = "Welcome, \(welcomeMessage ?? "")!"
        
//        navigationItem.hidesBackButton = true
    }
}

