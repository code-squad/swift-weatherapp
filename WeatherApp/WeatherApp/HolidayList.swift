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
    
    func receiveTableViewContentFormat( format: (_ date: String, _ subtitle: String, _ image: String?) -> Void, rowAt: Int) {
        guard let date = holidayInfoDictionaryArray[rowAt][KeyInfo.date.rawValue]
            else { return }
        guard let subtitle = holidayInfoDictionaryArray[rowAt][KeyInfo.subtitle.rawValue] else { return }
        guard let image = holidayInfoDictionaryArray[rowAt][KeyInfo.image.rawValue] else {
            format(date, subtitle, nil)
            return
        }
        format(date, subtitle, image)
    }

    init(_ flag: Bool = false){
        if flag {
            guard let holidayJsonData = HolidayJsonDTO.receiveCorrectData()else { return }
            convertJsonToDictionaryArray(holidayJsonData)
        }else {
            guard let holidayJsonData = HolidayJsonDTO.receiveJsonData() else { return }
            convertJsonToDictionaryArray(holidayJsonData)
        }
    }
    
    private mutating func convertJsonToDictionaryArray(_ data: Data) {
        guard let holidays = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            as? [[String: Any]] else {
                return
        }
        for holiday in holidays {
            var dictionaryElement = [String: String]()
            guard let date = holiday[KeyInfo.date.rawValue] as? String else {
                continue
            }
            guard let subtitle = holiday[KeyInfo.subtitle.rawValue] as? String else {
                continue
            }
            dictionaryElement.updateValue(date, forKey: KeyInfo.date.rawValue)
            dictionaryElement.updateValue(subtitle, forKey: KeyInfo.subtitle.rawValue)
            if checkNilForImage(holiday) {
                let image = holiday[KeyInfo.image.rawValue] as! String
                dictionaryElement.updateValue(image, forKey: KeyInfo.image.rawValue)
            }
            holidayInfoDictionaryArray.append(dictionaryElement)
        }
    }
    
    private func checkNilForImage(_ holiday: [String: Any]) -> Bool {
        return holiday[KeyInfo.image.rawValue] != nil
    }
}
