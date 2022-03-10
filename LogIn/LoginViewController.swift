//
//  ViewController.swift
//  LogIn
//
//  Created by MAC  on 08.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let name = "Marat"
    private let password = "1234"
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let greetingVC = segue.destination as? GreetingViewController else { return }
        greetingVC.welcomeMessage = nameTF.text
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInButtonPressed()
        }
        return true
    }
}

// MARK: - @IBActions
extension LoginViewController {
    @IBAction func logInButtonPressed() {
        guard nameTF.text == name, passwordTF.text == password else {
            showAlert(
                title: "Invalid login or password",
                message: "Please enter correct login and password",
                textField: passwordTF
            )
            return
        }
        performSegue(withIdentifier: "openWelcomeVC", sender: nil)
    }
    
    @IBAction func showAuthorizationData(_ sender: UIButton) {
        if sender.tag == 0 {
            showAlert(title: "Help", message: "Your username is \(name)")
        } else {
            showAlert(title: "Help", message: "Your password is \(password)")
        }
    }
    
    @IBAction func unwind(_ sender: UIStoryboardSegue) {
        nameTF.text = ""
        passwordTF.text = ""
    }
}
