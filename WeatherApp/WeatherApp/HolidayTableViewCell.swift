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
    
    func buildTableViewContentFormat(date: String, subtitle: String, image: String?){
        self.dateLabel.text = date
        self.subtitleLabel.text = subtitle
        if let imageName = image {
            let imageAssetName = self.buildImageAssetName(imageName)
            self.backgroundView = UIImageView.init(image: UIImage.init(named: imageAssetName))
            self.backgroundView?.contentMode = .scaleAspectFill
        }else {
            self.backgroundColor = .gray
        }
    }
    
    private func buildImageAssetName(_ info: String) -> String {
        return "\(ImageInfo.prefixWeather.rawValue)\(info)\(ImageInfo.suffixPngExtension.rawValue)"
    }
}
