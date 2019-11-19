//
//  DateTimeCell.swift
//  WeatherApp
//
//  Created by 이동영 on 2019/11/19.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit
import SnapKit
import Then

class DateTimeCell: UITableViewCell {
    
    // MARK: - UI
    private let dateLabel = UILabel()
    private let timeLabel = UILabel()
    private let eventLabel = UILabel()
    
    // MARK: - Configure
    func configure() {
        setUpAttributes()
        setUpConstraints()
    }
}
// MARK: - Layout & Attribute
extension DateTimeCell {
    
    private func setUpAttributes() {
        dateLabel.do {
            self.contentView.addSubview($0)
            $0.textAlignment = .left
            $0.font = UIFont.boldSystemFont(ofSize: 17)
            $0.text = "2019년 11월 19일"
        }
        
        timeLabel.do {
            self.contentView.addSubview($0)
            $0.textAlignment = .right
            $0.text = "오전 2시 30분"
        }
        
        eventLabel.do {
            self.contentView.addSubview($0)
            $0.textAlignment = .center
            $0.font.withSize(14)
            $0.textColor = .gray
            $0.text = "새로운 이벤트가 없습니다."
        }
    }
    
    private func setUpConstraints() {
        dateLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(15)
            make.width.equalToSuperview().dividedBy(2)
            make.height.greaterThanOrEqualTo(24)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(15)
            make.leading.equalTo(dateLabel.snp.trailing)
            make.width.equalToSuperview().dividedBy(2)
            make.height.greaterThanOrEqualTo(24)
        }
        
        eventLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom)
            make.height.greaterThanOrEqualTo(20)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
        }
    }
}
// MARK: - Reuseable
extension DateTimeCell: Reuseable {
    
    static var reuseIdentifier: String {
        return "DateTimeCell"
    }
}
