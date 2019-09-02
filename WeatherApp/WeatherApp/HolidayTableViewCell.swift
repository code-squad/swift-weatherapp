//
//  HolidayTableViewCell.swift
//  WeatherApp
//
//  Created by hw on 02/09/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit

class HolidayTableViewCell: UITableViewCell {
 
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dateLabel.text = nil
        subtitleLabel.text = nil
        self.backgroundView = nil
    }
}
