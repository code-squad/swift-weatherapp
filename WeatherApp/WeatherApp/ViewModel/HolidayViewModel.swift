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
    
    // MARK: - Dependencies
    private var loadService: DataLoader
    
    // MARK: Status Closure
    var dataDidLoad: (() -> Void)? {
        didSet {
            loadService.fetchHolidayData { self.holidays = $0 }
        }
    }
    
    // MARK: - Initializer
    init(loadService: DataLoader) {
        self.loadService = loadService
    }
    
    // MARK: - Method
    func numOfHolidays() -> Int {
        return holidays.count
    }
    
    func getHoliday(index: Int) -> Holiday {
        return holidays[index]
    }
    
}
