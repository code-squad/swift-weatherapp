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

//셀 높이는 80으로 지정
//가이드라인에 맞춰서 윗 부분에는 dateLabel과 timeLabel 이 폭을 2등분
//dateLabel은 좌측 정렬, timeLabel은 우측 정렬
//dateLabel과 timeLabel 높이는 24보다 크고 절반을 차지
//그 아래 eventLabel가 위치하고 높이는 20보다 크고 나머지 영역을 차지한다.
//eventLabel 내용은 가운데 정렬하고, 글자 크기는 14, 글자색은 회색

class DateTimeCell: UITableViewCell {
    
    // MARK: - UI
    let dateLabel = UILabel()
    let timeLabel = UILabel()
    let eventLabel = UILabel()
    
    // MARK: - Configure
    func configure() {
        self.contentView.addSubview(dateLabel)
        self.contentView.addSubview(timeLabel)
        self.contentView.addSubview(eventLabel)
        setUpConstraints()
        setUpAttribute()
    }
}
// MARK: - Layout & Attribute
extension DateTimeCell {
    
    private func setUpConstraints() {
        
        dateLabel.snp.makeConstraints { maker in
            maker.leading.top.equalToSuperview().inset(15)
            maker.height.greaterThanOrEqualTo(24)
            maker.width.equalToSuperview().dividedBy(2)
        }
        
        timeLabel.snp.makeConstraints { maker in
            maker.trailing.top.equalToSuperview().inset(15)
            maker.leading.equalTo(dateLabel.snp.trailing)
            maker.height.greaterThanOrEqualTo(24)
            maker.width.equalToSuperview().dividedBy(2)
        }
        
        eventLabel.snp.makeConstraints { maker in
            maker.top.equalTo(dateLabel.snp.bottom)
            maker.height.greaterThanOrEqualTo(20)
            maker.centerX.equalToSuperview()
        }
    }
    
    private func setUpAttribute() {
        dateLabel.do {
            $0.textAlignment = .left
            $0.font = UIFont.boldSystemFont(ofSize: 17)
            $0.text = "2019년 11월 19일"
        }
        
        timeLabel.do {
            $0.textAlignment = .right
            $0.text = "오전 2시 30분"
        }
        
        eventLabel.do {
            $0.textAlignment = .center
            $0.font.withSize(14)
            $0.textColor = .gray
            $0.text = "새로운 이벤트가 없습니다."
        }
    }
}
extension DateTimeCell: Reuseable {
    
    static var reuseIdentifier: String {
        return "DateTimeCell"
    }
}
