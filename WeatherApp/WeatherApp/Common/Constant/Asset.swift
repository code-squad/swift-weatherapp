//
//  WeatherAsset.swift
//  WeatherApp
//
//  Created by 이동영 on 2019/11/19.
//  Copyright © 2019 이동영. All rights reserved.
//

import Foundation

enum Asset: String {
    
    case sunny
    case rainny
    case snowy
    case cloudy
    
    var fileName: String {
        let prefix = "weather-"
        return prefix + self.rawValue
    }
    
}
