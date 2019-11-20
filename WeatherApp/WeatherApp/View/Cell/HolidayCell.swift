//
//  HolidayCell.swift
//  WeatherApp
//
//  Created by 이동영 on 2019/11/19.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit
import SnapKit

class HolidayCell: UITableViewCell {
    
    // MARK: - UI
    let backgroundImageView = UIImageView()
    let dataLabel = UILabel()
    let subTitleLabel = UILabel()
    
    // MARK: - Configure
    func configure(holiday: Holiday) {
        setUpAttributes()
        setUpConstraints()
        
        self.dataLabel.text = holiday.date
        self.subTitleLabel.text = holiday.subtitle
    }
}
// MARK: - Layout & Attributes
extension HolidayCell {
    
    private func setUpAttributes() {
        backgroundImageView.do {
            self.contentView.addSubview($0)
            $0.backgroundColor = .gray
        }
        
        dataLabel.do {
            self.contentView.addSubview($0)
            $0.font.withSize(24)
            $0.textColor = .white
            $0.textAlignment = .left
        }
        
        subTitleLabel.do {
            self.contentView.addSubview($0)
            $0.font.withSize(17)
            $0.textColor = .white
            $0.textAlignment = .right
        }
        
    }
    
    private func setUpConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        dataLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(10)
            make.width.equalToSuperview().multipliedBy(2).dividedBy(3)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview().inset(10)
            make.width.equalToSuperview().multipliedBy(1).dividedBy(3)
        }
    }
}
// MARK: - Reuseable
extension HolidayCell: Reuseable {
    static var reuseIdentifier: String {
        return "HolidayCell"
    }
}
