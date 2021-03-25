//
//  ConversationTableViewCell.swift
//  Chatbot
//
//  Created by Eimantas Kudarauskas on 2021-03-25.
//

import UIKit

class ConversationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var conversationImageView: UIImageView!
    @IBOutlet weak var conversationTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
