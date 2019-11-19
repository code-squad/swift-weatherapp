//
//  HolidayCell.swift
//  WeatherApp
//
//  Created by 이동영 on 2019/11/19.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit

class HolidayCell: UITableViewCell {
    
    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    func configure(holiday: Holiday) {
        self.textLabel?.text = holiday.date
        self.detailTextLabel?.text = holiday.subtitle
    }
    
}
// MARK: - Reuseable
extension HolidayCell: Reuseable {
    
    static var reuseIdentifier: String {
        return "HolidayCell"
    }
}
