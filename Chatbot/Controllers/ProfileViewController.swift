//
//  ProfileViewController.swift
//  Chatbot
//
//  Created by Eimantas Kudarauskas on 2021-03-20.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var signOutButtonView: UIView!
    @IBOutlet weak var signOutButton: UIView!
    
    @IBOutlet weak var profileImageHolderView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var chatViewLabel: UILabel!
    @IBOutlet weak var chatButtonHolderView: UIView!
    @IBOutlet weak var chatButtonView: UIView!
    @IBOutlet weak var chatViewButton: UIButton!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userNameHolderView: UIView!
    @IBOutlet weak var userNameEditButtonHolderView: UIView!
    @IBOutlet weak var userNameEditButton: UIButton!
    
    // MARK: - Vars
    private var currentUser: User? {
        FirebaseAuth.Auth.auth().currentUser
    }
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        /// Setup
        setupViews()
        setupLabels()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        /// Check if user is logged in, otherwise present login VC
        validateAuth()
    }

    // MARK: - Methods
    private func validateAuth() {
        if currentUser == nil {
            let vc = LoginViewController.instantiate()
            let nav = UINavigationController(rootViewController: vc)
            nav.isModalInPresentation = true
            present(nav, animated: false)
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        signOutButtonView.addButtonShadow()
        
        /// Holder view
        userNameHolderView.addViewShadow()
        userNameEditButtonHolderView.addButtonShadow()
        
        chatButtonHolderView.profileCellSetup()
        
        profileImageHolderView.profileViewSetup()
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2
    }
    
    private func setupLabels() {
        if let user = currentUser, let username = user.displayName {
            userNameLabel.text = username
        }
    }
    
    // MARK: - Actions
    @IBAction func signOutPressed(_ sender: Any) {
        do {
            try FirebaseAuth.Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    @IBAction func chatButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func editUserButtonPressed(_ sender: Any) {
        
    }
}

