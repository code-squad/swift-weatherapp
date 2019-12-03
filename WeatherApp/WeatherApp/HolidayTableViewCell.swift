//
//  HolidayTableViewCell.swift
//  WeatherApp
//
//  Created by kwangrae kim on 2019/11/25.
//  Copyright © 2019 elena. All rights reserved.
//

import UIKit

class HolidayTableViewCell: UITableViewCell {

    //MARK: - IBOutlet
    
    @IBOutlet weak var sibtitleLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var dateLable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dateLable.text = nil
        sibtitleLabel.text = nil
        weatherImage.image = nil
    }
    
    func chooseImage(name: String) {
        switch name {
        case "UIColor.gray": self.weatherImage.backgroundColor = UIColor.gray
        default: self.weatherImage.image = UIImage(named: name)
        }
    }
    
    func set(holiday: Holiday) {
        dateLable.text = holiday.data
        sibtitleLabel.text = holiday.subtitle
        chooseImage(name: holiday.image)
    }
}

}
