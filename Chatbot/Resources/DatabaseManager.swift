//
//  DatabaseManager.swift
//  Chatbot
//
//  Created by Eimantas Kudarauskas on 2021-03-25.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    
}

// MARK: - Account Management
extension DatabaseManager {
    
    public func isUserExists(with email: String, completion: @escaping ((Bool) -> Void)) {
        
        let safeEmail = email
            .replacingOccurrences(of: ".", with: "-")
            .replacingOccurrences(of: "@", with: "-")
        
        database.child(safeEmail).observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? String else {
                completion(false)
                return
            }
            print("value: \(value)")
            completion(true)
        }
    }
    
    /// Inserts new user to database
    public func insertUser(with user: ChatbotUser) {
        database.child(user.safeEmail).setValue(
            [
                "firstName" : user.firstName,
                "lastName" : user.lastName
            ])
    }
}

struct ChatbotUser {
    let firstName: String
    let lastName: String
    let emailAddress: String
    
    var safeEmail: String {
        let safeEmail = emailAddress
            .replacingOccurrences(of: ".", with: "-")
            .replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
}
