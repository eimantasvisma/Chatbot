//
//  RegisterViewController.swift
//  Chatbot
//
//  Created by Eimantas Kudarauskas on 2021-03-20.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController, Storyboarded {

    // MARK: - Outlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    // MARK: - Enums
    private enum Texts {
        static let title = "Register"
        static let dismiss = "Dismiss"
        static let userExists = "User with the same email already exists"
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
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailAddressTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func registerNewAccount() {
        guard
            let name = firstNameTextField.text,
            let surname = lastNameTextField.text,
            let email = emailAddressTextField.text,
            let pass = passwordTextField.text
        else { return }
        
        DatabaseManager.shared.isUserExists(with: email) { [weak self] exists in
            guard let strongSelf = self else { return }
            
            guard !exists else {
                strongSelf.showAlert(message: Texts.userExists)
                return
            }
            
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: pass) { authResult, error in
                guard error == nil else {
                    print("Error while creating user: \(String(describing: error?.localizedDescription))")
                    strongSelf.showAlert(message: error!.localizedDescription)
                    return
                }
     
                let user = ChatbotUser(firstName: name, lastName: surname, emailAddress: email)
                DatabaseManager.shared.insertUser(with: user)
                strongSelf.navigationController?.dismiss(animated: true)
            }
        }
    }
    
    private func showAlert(withTitle title: String? = "Oops!", message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Texts.dismiss, style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    // MARK: - Actions
    @IBAction func registerButtonPressed(_ sender: Any) {
        registerNewAccount()
    }
    

}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameTextField {
            lastNameTextField.becomeFirstResponder()
        } else if textField == lastNameTextField {
            emailAddressTextField.becomeFirstResponder()
        } else if textField == emailAddressTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            passwordTextField.resignFirstResponder()
        }
        return true
    }
}
