//
//  MyFotoViewController.swift
//  LogIn
//
//  Created by MAC  on 13.03.2022.
//

import UIKit

class MyFotoViewController: UIViewController {

    @IBOutlet var myFotoImage: UIImageView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myFotoImage.layer.cornerRadius = myFotoImage.frame.height / 2
        
        myFotoImage.image = UIImage(named: user.person.image)
    }
}
