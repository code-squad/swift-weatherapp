//
//  Holidays.swift
//  WeatherApp
//
//  Created by 조재흥 on 19. 3. 28..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

struct Holidays {
    
    private var holidays: [[String: String]]
    
    init(holidays: [[String: String]]) {
        self.holidays = holidays
    }
    
    subscript(index: Int) -> [String: String]? {
        get {
            guard 0 <= index && index < holidays.count else { return nil }
            return holidays[index]
        }
    }
    
    func count() -> Int {
        return holidays.count
    }
}
