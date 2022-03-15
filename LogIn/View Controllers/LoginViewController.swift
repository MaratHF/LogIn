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
    
    private let user = User.getUserData()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        for viewController in viewControllers {
            if let greetingVC = viewController as? GreetingViewController {
                greetingVC.welcomeMessage = user.person.fullName
            }
            else if let navigationVC = viewController as? UINavigationController {
                guard let aboutMeVC = navigationVC.topViewController as? AboutMeViewController else{
                    return }
                aboutMeVC.person = user
            }
        }
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - @IBActions
extension LoginViewController {
    @IBAction func logInButtonPressed() {
        guard nameTF.text == "Marat", passwordTF.text == "1234" else {
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
            showAlert(title: "Help", message: "Your username is \(user.username)")
        } else {
            showAlert(title: "Help", message: "Your password is \(user.password)")
        }
    }
    
    @IBAction func unwind(_ sender: UIStoryboardSegue) {
        nameTF.text = ""
        passwordTF.text = ""
    }
}

// MARK: - Keyboard
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
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
