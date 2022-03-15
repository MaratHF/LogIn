//
//  AboutMeViewController.swift
//  LogIn
//
//  Created by MAC  on 13.03.2022.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    @IBOutlet var personLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var hobbyLabel: UILabel!
    @IBOutlet var workingPositionLabel: UILabel!
    
    var person: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        personLabel.text = "Person: \(person.person.fullName)"
        ageLabel.text = "Age: \(person.person.age)"
        cityLabel.text = "City: \(person.person.city)"
        hobbyLabel.text = "Hobby: \(person.person.hobby)"
        workingPositionLabel.text = "Working position: \(person.person.workingPosition)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let myFotoVC = segue.destination as? MyFotoViewController else { return }
        myFotoVC.user = person
    }
}
