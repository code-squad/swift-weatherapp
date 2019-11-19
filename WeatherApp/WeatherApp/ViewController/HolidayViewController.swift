//
//  HolidayViewController.swift
//  WeatherApp
//
//  Created by 이동영 on 2019/11/19.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit
import SnapKit
import Then

class HolidayViewController: UIViewController {
    
    
    // MARK: - UI
    let holidayTableView = UITableView()
    
    // MARK: - Dependencies
    var holidaysDataSource: UITableViewDataSource?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    
}
// MARK: - Layout & Attribute
extension HolidayViewController {
    
    private func configureTableView() {
        setUpTableViewAttributes()
        setUpTableViewConstraints()
    }
    
    private func setUpTableViewAttributes() {
        holidayTableView.do {
            $0.dataSource = holidaysDataSource
            self.view.addSubview($0)
            $0.register(HolidayCell.self,
                        forCellReuseIdentifier: HolidayCell.reuseIdentifier)
        }
    }
    
    private func setUpTableViewConstraints() {
        holidayTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
