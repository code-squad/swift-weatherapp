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
        initializeConstraint()
        initaializLabelSetting()
        setLabelDateAndTime()
    }
    
    private func initializeConstraint() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.widthAnchor.constraint(equalTo: timeLabel.widthAnchor, multiplier: 1.0).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: timeLabel.leadingAnchor).isActive = true
        eventLabel.translatesAutoresizingMaskIntoConstraints = false
        eventLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor).isActive = true
    }
    
    private func initaializLabelSetting() {
        dateLabel.textAlignment = .left
        timeLabel.textAlignment = .right
        eventLabel.textAlignment = .center
        eventLabel.textColor = UIColor.gray
        dateLabel.font = UIFont.boldSystemFont(ofSize: 17)
        eventLabel.font.withSize(14)
        eventLabel.text = "새로운 이벤트가 없습니다."
    }
    
    private func setLabelDateAndTime() {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        let stringDate = dateFormatter.string(from: today)
        dateLabel.text = stringDate
        
        dateFormatter.dateFormat = "a hh시 mm분"
        let stringTime = dateFormatter.string(from: today)
        timeLabel.text = stringTime
    }
}
