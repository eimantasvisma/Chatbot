//
//  LoginViewController.swift
//  Chatbot
//
//  Created by Eimantas Kudarauskas on 2021-03-20.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, Storyboarded {
    
    // MARK: - Outlets
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Enums
    private enum Texts {
        static let title = "Login"
        static let createAccount = "Create Account"
    }
    
    // MARK: - Vars

    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()

        /// Setup
        setupView()
    }
    
    // MARK: - Methods
    private func setupView() {
        view.backgroundColor = .white
        title = Texts.title
        emailAddressTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func signInUser() {
        guard
            let emai = emailAddressTextField.text,
            let pass = passwordTextField.text
        else { return }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: emai, password: pass) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            
            guard let result = authResult, error == nil else {
                print("Error while creating user: \(String(describing: error?.localizedDescription))")
                return
            }
            
            let user = result.user
            print("Logged in with user: \(user)")
            strongSelf.navigationController?.dismiss(animated: true)
        }
    }
    
    // MARK: - Actions
    @IBAction func registerButtonPressed(_ sender: Any) {
        let vc = RegisterViewController.instantiate()
        vc.title = Texts.createAccount
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        signInUser()
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailAddressTextField {
            handleEmailReturnKeyPress(for: textField)
        } else if textField == passwordTextField {
            handlePasswordReturnKeyPress(for: textField)
        }
        return true
    }
    
    fileprivate func handleEmailReturnKeyPress(for textField: UITextField) {
        if let email = emailAddressTextField.text, email != "" {
            if let pass = passwordTextField.text, pass != "" {
                emailAddressTextField.resignFirstResponder()
            } else {
                passwordTextField.becomeFirstResponder()
            }
        } else {
            print("Email is mandatory!")
        }
    }
    
    fileprivate func handlePasswordReturnKeyPress(for textField: UITextField) {
        if let pass = passwordTextField.text, pass != "" {
            if let email = emailAddressTextField.text, email != "" {
                passwordTextField.resignFirstResponder()
            } else {
                emailAddressTextField.becomeFirstResponder()
            }
        } else {
            print("Pass is mandatory!")
        }
    }
}
