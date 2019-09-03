//
//  HolidayList.swift
//  WeatherApp
//
//  Created by hw on 31/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation


struct HolidayList {
    private var holidays = [Holiday]()

    func receiveTableViewCountFormat(format: (Int) -> Int) -> Int {
        return format(holidays.count)
    }
    
    func receiveTableViewContentFormat( format: (_ date: String, _ subtitle: String, _ image: String?) -> Void, rowAt: Int) {
        let date = holidays[rowAt].date
        
        let subtitle = holidays[rowAt].subtitle
        guard let image = holidays[rowAt].image else {
            format(date, subtitle, nil)
            return
        }
        format(date, subtitle, image)
    }

    init(_ flag: Bool = false){
        guard let holidayJsonData = HolidayJsonDTO.receiveJsonData(flag)else { return }
        convertJsonToDictionaryArray(holidayJsonData)
    }
    
    private mutating func convertJsonToDictionaryArray(_ data: Data) {
        guard let holidayList = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            as? [[String: Any]] else {
                return
        }
        for holiday in holidayList {
            guard let date = holiday[KeyInfo.date.rawValue] as? String else {
                continue
            }
            guard let subtitle = holiday[KeyInfo.subtitle.rawValue] as? String else {
                continue
            }
            if checkNilForImage(holiday) {
                let image = holiday[KeyInfo.image.rawValue] as! String
                let holidayElement = Holiday.init(date: date, subtitle: subtitle, image: image)
                holidays.append(holidayElement)
            }else {
                let holidayElement = Holiday.init(date: date, subtitle: subtitle, image: nil)
                holidays.append(holidayElement)
            }
        }
    }
    
    private func checkNilForImage(_ holiday: [String: Any]) -> Bool {
        return holiday[KeyInfo.image.rawValue] != nil
    }
}
