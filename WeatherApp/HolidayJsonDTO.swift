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
    init(){
        let holidayURL = URL.init(string: "http://public.codesquad.kr/jk/weatherapp/customcell.json")!
        do {
            let holidayDataString = try String(contentsOf: holidayURL, encoding: .utf8)
            guard let jsonData = holidayDataString.data(using: .utf8) else {
                return
            }
            self.data = jsonData
        }catch {
        }
    }
    
    var initiateHolidayData: Data {
        return self.data
    }
}
