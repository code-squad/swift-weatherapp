//
//  HolidayList.swift
//  WeatherApp
//
//  Created by hw on 31/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation


struct HolidayList {
    private var holidayInfoDictionaryArray = [[String: String]]()
    
    func receiveTableViewCountFormat(format: (Int) -> Int) -> Int {
        return format(holidayInfoDictionaryArray.count)
    }
    
    func receiveTableViewContentFormat( format: (_ date: String, _ subtitle: String) -> Void, rowAt: Int) {
        guard let date = holidayInfoDictionaryArray[rowAt][KeyInfo.date.rawValue]
            else { return }
        guard let subtitle = holidayInfoDictionaryArray[rowAt][KeyInfo.subtitle.rawValue] else { return }
        format(date, subtitle)
    }
    
    init(){
        let holidayJsonData = HolidayJsonDTO().initiateHolidayData
        convertJsonToDictionaryArray(holidayJsonData)
    }
    
    private mutating func convertJsonToDictionaryArray(_ data: Data)  {
        guard let holidays = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            as? [[String: Any]] else {
                return
        }
        var subtitle = ""
        var date = ""
        var image = ""
        var dictionaryElement = [String: String]()
        for holiday in holidays {
            guard holiday[KeyInfo.date.rawValue] != nil else {
                continue
            }
            guard holiday[KeyInfo.subtitle.rawValue] != nil else {
                continue
            }
            date = holiday[KeyInfo.date.rawValue] as! String
            subtitle = holiday[KeyInfo.subtitle.rawValue] as! String
            dictionaryElement.updateValue(date, forKey: KeyInfo.date.rawValue)
            dictionaryElement.updateValue(subtitle, forKey: KeyInfo.subtitle.rawValue)
            
            if checkNilForImage(holiday) {
                image = holiday[KeyInfo.image.rawValue] as! String
                dictionaryElement.updateValue(image, forKey: KeyInfo.image.rawValue)
            }
            holidayInfoDictionaryArray.append(dictionaryElement)
        }
    }
    
    private func checkNilForImage(_ holiday: [String: Any]) -> Bool {
        guard holiday[KeyInfo.image.rawValue] != nil else {
            return false
        }
        return true
    }
}
