//
//  Holidays.swift
//  WeatherApp
//
//  Created by kwangrae kim on 2019/11/20.
//  Copyright © 2019 elena. All rights reserved.
//

import Foundation

struct Holidays {
    private var holidays = [Holiday]()

    init?() {
        guard let data = JSONParser.parseJSONData() else {
            return nil
        }
        
        for index in data {
            guard
            let date = index["date"],
            let subTitle = index["subtitle"]
            else { continue }
            
            self.holidays.append(Holiday(data: date, subtitle: subTitle, image: changeImage(name: index["image"])))
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
    
    /// 이미지파일 이름과 동일하게 변경하기 위해 수정
    func changeImage(name: String?) -> String {
        switch name {
        case "sunny": return "weather-sunny"
        case "cloudy": return "weather-cloudy"
        case "snowy": return "weather-snowy"
        case "rainny": return "weather-rainny"
        default: return "UIColor.gray"
        }
    }
}

struct Holiday {
    var data: String = ""
    var subtitle: String = ""
    var image: String = ""
}
