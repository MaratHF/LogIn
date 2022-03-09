//
//  ViewController.swift
//  LogIn
//
//  Created by MAC  on 08.03.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var forgotNameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    private var name = "Marat"
    private var password = "1234"
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let _ = touches.first {
            view.endEditing(true)
        }
        super .touchesBegan(touches, with: event)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let greetingVC = segue.destination as? GreetingViewController else { return }
        greetingVC.welcomeMessage = nameTF.text
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - @IBActions
extension MainViewController {
    @IBAction func logInButtonPressed() {
        guard let inputName = nameTF.text else {return}
        
        if inputName != name {
            showAlert(
                title: "Invalid login or password",
                message: "Please enter correct login and password"
            )
        }
        
        guard let inputPassword = passwordTF.text else {return}
        
        if inputPassword != password {
            showAlert(
                title: "Invalid login or password",
                message: "Please enter correct login and password"
            )
        }
    }
    
    @IBAction func forgotNameButtonPressed() {
        showAlert(title: "Help", message: "Username is \(name)")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(title: "Help", message: "Password is \(password)")
    }
    
    @IBAction func unwind(_ sender: UIStoryboardSegue) {
        nameTF.text = ""
        passwordTF.text = ""
    }
}
