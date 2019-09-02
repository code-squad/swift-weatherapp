//
//  HolidayViewController.swift
//  WeatherApp
//
//  Created by hw on 30/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit

class HolidayViewController: UIViewController {
    private var holidayList: HolidayList!
    @IBOutlet weak var holidayTableView: UITableView!
    
    func configureModel(holidayList: HolidayList) {
        self.holidayList = holidayList
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HolidayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let format = { (count: Int) in
            return count
        }
        let count = holidayList.receiveTableViewCountFormat(format: format)
        return  count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "HolidayCustomCell") as? HolidayTableViewCell else {
            return HolidayTableViewCell()
        }
        cell.backgroundView?.clearsContextBeforeDrawing = true
        let format = { (date: String, subtitle: String, image: String? ) in
            cell.dateLabel.text = date
            cell.subtitleLabel.text = subtitle
            if let imageName = image {
                let imageAssetName = self.buildImageAssetName(imageName)
                cell.backgroundView = UIImageView.init(image: UIImage.init(named: imageAssetName))
                cell.backgroundView?.contentMode = .scaleAspectFill
            }else {
                cell.backgroundColor = .gray
            }
        }
        holidayList.receiveTableViewContentFormat(format: format, rowAt: indexPath.row)
        return cell
    }
    
    private func buildImageAssetName(_ info: String) -> String {
        return "\(ImageInfo.prefixWeather.rawValue)\(info)\(ImageInfo.suffixPngExtension.rawValue)"
    }
}


