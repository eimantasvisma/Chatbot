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
    }
    
    private func registerNewAccount() {
        guard
            let name = firstNameTextField.text,
            let surname = lastNameTextField.text,
            let emai = emailAddressTextField.text,
            let pass = passwordTextField.text
        else { return }
        
        FirebaseAuth.Auth.auth().createUser(withEmail: emai, password: pass) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            
            guard error == nil else {
                print("Error while creating user: \(String(describing: error?.localizedDescription))")
                return
            }
 
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = "\(name) \(surname)"
            changeRequest?.commitChanges { error in
                guard error == nil else {
                    print("Error while updating user profile: \(String(describing: error?.localizedDescription))")
                    return
                }
                print("User profile updated!")
            }
            strongSelf.navigationController?.dismiss(animated: true)
        }
    }
    
    // MARK: - Actions
    @IBAction func registerButtonPressed(_ sender: Any) {
        registerNewAccount()
    }
    

}
