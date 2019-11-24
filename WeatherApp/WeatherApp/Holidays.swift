//
//  Holidays.swift
//  WeatherApp
//
//  Created by kwangrae kim on 2019/11/20.
//  Copyright © 2019 elena. All rights reserved.
//

import Foundation

struct Holidays {
    //private var holidays: [[String: String]]
    private var holidays = [Holiday]()

    init?() {
        let fixedData = """
                    [{"date":"1월1일", "subtitle":"신정"},
                    {"date":"2월16일", "subtitle":"구정"},
                    {"date":"3월1일", "subtitle":"삼일절"},
                    {"date":"5월5일", "subtitle":"어린이날"},
                    {"date":"5월22일", "subtitle":"석가탄신일"},
                    {"date":"6월6일", "subtitle":"현충일"},
                    {"date":"8월15일", "subtitle":"광복절"},
                    {"date":"9월24일", "subtitle":"추석"},
                    {"date":"10월3일", "subtitle":"개천절"},
                    {"date":"10월9일", "subtitle":"한글날"},
                    {"date":"12월25일", "subtitle":"성탄절"}]
                    """
        
        ///jsonData -> foundationData
        guard let jsonData = fixedData.data(using: String.Encoding.utf8, allowLossyConversion: false),
            let foundationData = try? JSONSerialization.jsonObject(with: jsonData) as? Array<Dictionary<String,String>> else { return nil }
        
        for index in foundationData {
            guard
            let date = index["date"],
            let subTitle = index["subtitle"]
            else { continue }
            self.holidays.append(Holiday(data: date, subtitle: subTitle))
        }
        
    }
    
    //MARK: -func
    ///holidays 전체 갯수 반환
    func count() -> Int {
        return holidays.count
    }

    ///holiday 데이터를 반환
    func sendHoliday(index: Int) -> Holiday? {
        guard 0 <= index  && index < count() else {
            return nil
        }
        return holidays[index]
    }
}

struct Holiday {
    var data: String = ""
    var subtitle: String = ""
}
