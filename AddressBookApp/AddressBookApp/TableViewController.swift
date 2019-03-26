//
//  TableViewController.swift
//  AddressBookApp
//
//  Created by 윤동민 on 25/03/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialConfigure()
    }
    
    private func initialConfigure() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        eventLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.widthAnchor.constraint(equalTo: timeLabel.widthAnchor, multiplier: 1.0).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: timeLabel.leadingAnchor).isActive = true
        eventLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor).isActive = true
        
        dateLabel.textAlignment = .left
        timeLabel.textAlignment = .right
        eventLabel.textAlignment = .center
        eventLabel.textColor = UIColor.gray
        eventLabel.font.withSize(14)
        
        dateLabel.backgroundColor = UIColor.yellow
        timeLabel.backgroundColor = UIColor.red
        eventLabel.backgroundColor = UIColor.blue
    }
}
