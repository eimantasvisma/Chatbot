//
//  ConversationViewController.swift
//  Chatbot
//
//  Created by Eimantas Kudarauskas on 2021-03-20.
//

import UIKit

class ConversationViewController: UITableViewController, Storyboarded {
    
    private let cellIdentifier = "ConversationTableViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        navigationController?.isNavigationBarHidden = false
    }
}

// MARK: - Table view data source

extension ConversationViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ConversationTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}
