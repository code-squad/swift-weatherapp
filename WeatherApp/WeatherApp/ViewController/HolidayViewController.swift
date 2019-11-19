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
    
    private var holidays = [Holiday]()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchDataSource()
        configureTableView()
    }
    
    // MARK: - Method
    private func fetchDataSource() {
        guard
            let holidaysJSON = try? JSONSerialization.jsonObject(with: MyData.holiday) as? [[String: String]]
            else { return }
        
        for holiday in holidaysJSON {
            let date = holiday["date"]!
            let subTitle = holiday["subtitle"]!
            holidays.append(Holiday(date: date, subtitle: subTitle))
        }
        
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
            self.view.addSubview($0)
            $0.dataSource = self
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
// MARK: UITableViewDataSource
extension HolidayViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return holidays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withType: HolidayCell.self, for: indexPath)
            else {
                assertionFailure("HolidayCell is not cofigured")
                return HolidayCell()
        }
        
        let holiday = holidays[indexPath.row]
        cell.configure(holiday: holiday)
        return cell
    }
}
