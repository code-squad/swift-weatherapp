//
//  HolidayJsonDTO.swift
//  WeatherApp
//
//  Created by hw on 31/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

struct HolidayJsonDTO {
    private var data: Data = Data.init()
    
    static func receiveJsonData(_ flag: Bool) -> Data?{
        var holidayURL: URL
        if flag {
            holidayURL = URL.init(string: URLInfo.correctURL)!
        }else {
            holidayURL = URL.init(string: URLInfo.wrongURL)!
        }
        do {
            let holidayDataString = try String(contentsOf: holidayURL, encoding: .utf8)
            guard let jsonData = holidayDataString.data(using: .utf8) else {
                return nil
            }
            return jsonData
        }catch {
            let result = [ URLInfo.result : error ]
            NotificationCenter.default.post(name: .NetworkError, object: nil, userInfo: result)
        }
        return nil
    }
    
    var initiateHolidayData: Data {
        return self.data
    }
}

extension Notification.Name {
    static var NetworkError = Notification.Name(rawValue: "networkError")
}
