//
//  HolidayViewController.swift
//  WeatherApp
//
//  Created by kwangrae kim on 2019/11/19.
//  Copyright © 2019 elena. All rights reserved.
//

import UIKit

class HolidayViewController: UIViewController , UITableViewDataSource {
    
    //MARK: -value
    private var holiday = Holidays()

    //MARK: -IBOutlet
    @IBOutlet weak var holidayTable: UITableView!
    
    //MARK: -override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        holidayTable.rowHeight = 80.0
        
    }
    
    //MARK: -UITableViewDataSource Add
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let row = holiday?.count() else {
            return 0
        }
        return row
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let holidayCell = tableView.dequeueReusableCell(withIdentifier: HolidayTableViewCell.reuseID, for: indexPath) as? HolidayTableViewCell else {
            return .init()
        }
        
        guard let holiday = self.holiday?.sendHoliday(index: indexPath.row) else {
            return holidayCell
        }
        
        holidayCell.set(holiday: holiday)
        
        return holidayCell
    }
}
