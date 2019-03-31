//
//  HolidayTableViewCell.swift
//  WeatherApp
//
//  Created by 조재흥 on 19. 3. 28..
//  Copyright © 2019 hngfu. All rights reserved.
//

import UIKit

class HolidayTableViewCell: UITableViewCell {

    //MARK: - Properties
    //MARK: IBOutlet
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    //MARK: Private
    
    private let weatherPrefix = "weather-"
    
    //MARK: - Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func show(with holiday: Holiday) {
        self.dateLabel.text = holiday.date
        self.subtitleLabel.text = holiday.subtitle
        if let imageName = holiday.image {
            self.weatherImageView.image = UIImage(named: weatherPrefix + imageName)
        }
    }
}
