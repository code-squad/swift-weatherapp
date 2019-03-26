//
//  Weather.swift
//  AddressBookApp
//
//  Created by 윤동민 on 26/03/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

enum Weather: Int, CaseIterable {
    case cloudy = 0
    case rainny = 1
    case snowy = 2
    case sunny = 3
    
    func getText() -> String {
        switch self {
        case .cloudy: return "오늘 날씨는 구름이 낍니다."
        case .rainny: return "오늘 날씨는 흐림입니다."
        case .snowy: return "오늘 날씨는 눈이 옵니다."
        case .sunny: return "오늘 날씨는 화창합니다."
        }
    }
    
    func getImageName() -> String {
        switch self {
        case .cloudy: return "weather-cloudy"
        case .rainny: return "weather-rainny"
        case .snowy: return "weather-snowy"
        case .sunny: return "weather-sunny"
        }
    }
}
