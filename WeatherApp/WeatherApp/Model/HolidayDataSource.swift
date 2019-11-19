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
