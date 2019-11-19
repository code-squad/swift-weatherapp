//
//  HolidayDataSource.swift
//  WeatherApp
//
//  Created by 이동영 on 2019/11/19.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit

class HolidayDataSource: NSObject {
    
    // MARK: - Properties
    private var holidays = [Holiday]()
    
    // MARK: - Method
    func fetchDataSource() {
        guard
            let holidaysJSON = try? JSONSerialization.jsonObject(with: MyData.holiday) as? [[String: String]]
            else { return }
        
        for holiday in holidaysJSON {
            guard
                let date = holiday["date"],
                let subTitle = holiday["subtitle"]
                else { continue }
            holidays.append(Holiday(date: date, subtitle: subTitle))
        }
        
    }
}
// MARK: UITableViewDataSource
extension HolidayDataSource: UITableViewDataSource {
    
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
