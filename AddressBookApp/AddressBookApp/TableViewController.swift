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
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeConstraint()
        initaializLabelSetting()
        setLabelDateAndTime()
        setWeatherImageAndText()
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
    
    private func setWeatherImageAndText() {
        let random = arc4random_uniform(UInt32(Weather.allCases.count))
        guard let weather: Weather = Weather(rawValue: Int(random)) else { return }
        
        weatherImage.image = UIImage(named: weather.getImageName())
        weatherDescription.text = weather.getText()
        weatherDescription.textColor = UIColor.white
        weatherDescription.font = UIFont.boldSystemFont(ofSize: 20)
    }
}

enum Weather: Int, CaseIterable {
    case cloudy = 0
    case rainny = 1
    case snowy = 2
    case sunny = 3
    
    func getText() -> String {
        switch self {
        case .cloudy: return "오늘 날씨를 구름이낍니다."
        case .rainny: return "오늘 날씨는 흐림입니다."
        case .snowy: return "오늘 날씨는 눈이옵니다."
        case .sunny: return "오늘 날씨는 화창합니다."
        }
    }
    
    func getImageName() -> String {
        switch self {
        case .cloudy: return "weather-cloudy"
        case .rainny: return "weather-rainny"
        case .snowy: return "weather-snowy"
        case .sunny: return "weather-sunny"
        }
    }
}
