//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by 이동영 on 2019/11/19.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit
import SnapKit
import Then

class WeatherCell: UITableViewCell {
    
    // MARK: - UI
    let weatherImageView = UIImageView()
    let weatherDescription = UILabel()
    let detailButton = UIButton(type: .infoLight)
    
    // MARK: - Configure
    func configure() {
        setUpAttributes()
        setUpConstraints()
    }
}
// MARK: - Layout & Attribute
extension WeatherCell {
    
    private func setUpAttributes() {
        weatherImageView.do {
            self.contentView.addSubview($0)
            $0.contentMode = .scaleAspectFill
            $0.image = UIImage(named: AssetName.rainny)
        }
        
        weatherDescription.do {
            self.contentView.addSubview($0)
            $0.font = UIFont.boldSystemFont(ofSize: 20)
            $0.textColor = .white
            $0.text = "오늘의 날씨는 흐림입니다."
        }
        
        detailButton.do {
            self.contentView.addSubview($0)
        }
    }
    
    private func setUpConstraints() {
        weatherImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        weatherDescription.snp.makeConstraints { make in
            make.centerY.equalTo(weatherImageView)
            make.leading.equalToSuperview().offset(20)
        }
        
        detailButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(20)
        }
    }
}
// MARK: - Reuseable
extension WeatherCell: Reuseable {
    
    static var reuseIdentifier: String {
        return "WeatherCell"
    }
}
