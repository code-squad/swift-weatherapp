//
//  HolidayTableViewCell.swift
//  AddressBookApp
//
//  Created by 윤동민 on 28/03/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class HolidayTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func chooseImage(name: String?) {
        switch name {
        case "sunny": self.weatherImage.image = UIImage(named: "weather-sunny")
        case "cloudy": self.weatherImage.image = UIImage(named: "weather-cloudy")
        case "snowy": self.weatherImage.image = UIImage(named: "weather-snowy")
        case "rainny": self.weatherImage.image = UIImage(named: "weather-rainny")
        default: self.weatherImage.backgroundColor = UIColor.gray
        }
    }
}
