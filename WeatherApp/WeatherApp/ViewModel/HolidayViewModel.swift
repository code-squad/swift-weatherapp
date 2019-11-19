//
//  HolidayViewMode.swift
//  WeatherApp
//
//  Created by 이동영 on 2019/11/20.
//  Copyright © 2019 이동영. All rights reserved.
//

import Foundation

// MARK: - HolidayViewModelType
protocol HolidayViewModelType: class {
    
    var dataDidLoad: (() -> Void)? { get set }
    
    func numOfHolidays() -> Int
    func getHoliday(index: Int) -> Holiday
}

// MARK: - HolidayViewModel
class HolidayViewModel: HolidayViewModelType {
    
    // MARK: - Properties
    private var holidays = [Holiday]()
    
    // MARK: Status Closure
    var dataDidLoad: (() -> Void)? {
        didSet { fetchHolidayData() }
    }
    
    // MARK: - Method
    func numOfHolidays() -> Int {
        return holidays.count
    }
    
    func getHoliday(index: Int) -> Holiday {
        return holidays[index]
    }
    
    private func fetchHolidayData() {
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
        
        dataDidLoad?()
    }
}
