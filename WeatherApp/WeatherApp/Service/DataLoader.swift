//
//  DataLoader.swift
//  WeatherApp
//
//  Created by 이동영 on 2019/11/21.
//  Copyright © 2019 이동영. All rights reserved.
//

import Foundation

struct DataLoader {
    
    func fetchHolidayData(completion: @escaping ([Holiday]) -> Void) {
        var holidays = [Holiday]()
        guard
            let holidayData = try? Data(contentsOf: MyData.url),
            let holidaysJSON = try? JSONSerialization.jsonObject(with: holidayData) as? [[String: String]]
            else { return }
        
        for holiday in holidaysJSON {
            guard
                let date = holiday["date"],
                let subTitle = holiday["subtitle"],
                let image = holiday["image"]
                else { continue }
            
            holidays.append(Holiday(date: date, subtitle: subTitle, image: image))
            
            completion(holidays)
        }
    }
}
