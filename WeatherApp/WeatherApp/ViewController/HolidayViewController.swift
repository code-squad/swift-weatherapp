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
    var holidayViewModel: HolidayViewModelType? {
        didSet { bindViewModel() } 
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    
}
// MARK: - Bind
extension HolidayViewController {
    
    func bindViewModel() {
        guard let viewModel = holidayViewModel else { return }
        
        viewModel.dataDidLoad = { [weak self] in
            self?.holidayTableView.reloadData()
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
            $0.dataSource = self
            self.view.addSubview($0)
            $0.register(HolidayCell.self,
                        forCellReuseIdentifier: HolidayCell.reuseIdentifier)
            $0.rowHeight = 80
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
        return holidayViewModel?.numOfHolidays() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withType: HolidayCell.self, for: indexPath),
            let holiday = holidayViewModel?.getHoliday(index: indexPath.row)
            else {
                assertionFailure("HolidayCell is not cofigured")
                return HolidayCell()
        }
        
        cell.configure(holiday: holiday)
        return cell
    }
}
