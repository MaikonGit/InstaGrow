//
//  HomeViewController.swift
//  InstaGrow
//
//  Created by Maikon Ferreira on 18/01/22.
//
import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         
        //Check Auth Status
        handleNotAuthenticated()
        
        
    }
    
    private func handleNotAuthenticated() {
        if Auth.auth().currentUser == nil {
            //show login
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
       
    }
}
