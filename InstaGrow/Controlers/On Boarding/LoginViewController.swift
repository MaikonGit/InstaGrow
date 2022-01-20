//
//  LoginViewController.swift
//  InstaGrow
//
//  Created by Maikon Ferreira on 18/01/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        didLoginTaped()
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        didRegisterTaped()
    }
    
    
    func didLoginTaped() {
        passwordTextField.resignFirstResponder()
        userTextField.resignFirstResponder()
        
        guard let userField = userTextField.text, !userField.isEmpty,
              let password = passwordTextField.text, !password.isEmpty, password.count >= 8 else {
                  return
              }
        //login funcionatity
        var userName: String?
        var email: String?
        
        if userField.contains("@"), userField.contains(".") {
            //email
            email = userField
        } else {
            //username
            userName = userField
        }
                
        AuthManager.shared.loginUser(username: userName, email: email, password: password) { succes in
            DispatchQueue.main.async {
                if succes {
                    //user logged in
                    self.dismiss(animated: true, completion: nil)
                } else {
                    //error occurred
                    let alert = UIAlertController(title: "Log in error",
                                                  message: "We are unable to log you in.",
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss",
                                                  style: .cancel))
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
    func didRegisterTaped() {
        let registrationVC = RegistrationViewController()
        registrationVC.modalPresentationStyle = .fullScreen
        present(registrationVC, animated: true)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            didLoginTaped()
        }
        return true
    }
}
