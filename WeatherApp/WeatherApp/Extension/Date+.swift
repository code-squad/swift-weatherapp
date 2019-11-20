//
//  Date+.swift
//  WeatherApp
//
//  Created by 이동영 on 2019/11/19.
//  Copyright © 2019 이동영. All rights reserved.
//

import Foundation

extension Date {
    
    static func currentTime(with pattern: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = pattern
        
        return dateFormatter.string(from: Date())
    }
}
