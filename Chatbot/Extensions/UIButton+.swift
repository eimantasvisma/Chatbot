//
//  UIButton+.swift
//  Chatbot
//
//  Created by Eimantas Kudarauskas on 2021-03-21.
//

import UIKit

extension UIButton {
    
    func buttonIsDisabled() {
        isEnabled = false
        backgroundColor = .darkGray
    }
    
    func buttonIsEnabled() {
        isEnabled = false
        backgroundColor = .blue
    }
}
