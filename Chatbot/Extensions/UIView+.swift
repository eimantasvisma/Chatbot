//
//  UIView+.swift
//  Chatbot
//
//  Created by Eimantas Kudarauskas on 2021-03-23.
//

import UIKit

extension UIView {
    
    func addViewShadow() {
        self.layer.shadowColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
//        self.layer.shadowOffset = CGSize(width: 0, height: 2)
//        self.layer.shadowOpacity = 0.3
//        self.layer.shadowRadius = 8.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 8.0
    }
    
    func addButtonShadow() {
        self.layer.shadowColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 8.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 8.0
    }
    
    func profileViewSetup() {
        self.backgroundColor = .white
        self.layer.shadowColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = self.frame.width/2
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.width/2
    }
    
    func profileCellSetup() {
        self.backgroundColor = .white
//        self.layer.shadowColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
//        self.layer.shadowOffset = CGSize(width: 0, height: 2)
//        self.layer.shadowOpacity = 0.3
//        self.layer.shadowRadius = 8.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 8.0
    }
}
