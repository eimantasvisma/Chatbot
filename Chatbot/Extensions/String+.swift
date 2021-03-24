//
//  String+.swift
//  Chatbot
//
//  Created by Eimantas Kudarauskas on 2021-03-20.
//

import Foundation

extension String {
    private var name: String {
        return self.components(separatedBy: ".")[1]
    }

    func storyboardName() -> String {
        return name
    }
    
    func nibName() -> String {
        return name
    }
}
