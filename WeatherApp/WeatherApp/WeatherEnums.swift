//
//  keyInfo.swift
//  WeatherApp
//
//  Created by hw on 30/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

enum KeyInfo: String {
    case date = "date"
    case subtitle = "subtitle"
    case image = "image"
}

enum ImageInfo: String {
    case suffixPngExtension = ".png"
    case prefixWeather = "weather-"
}

enum ReusableCellInfo: String {
    case holidayCustomCell = "HolidayCustomCell"
    case subtitleCell = "subtitleCell"
}

enum SystemErrorMessage: String {
    case networkError = "Network Error"
    case detailMessage = "서버로부터 데이터를 로드할 수 없습니다.\n"
}

enum ButtonMessage: String, CustomStringConvertible {
    case retry = "재시도"
    case exit = "연결 취소"
    var description: String {
        return self.rawValue
    }
}

enum URLInfo: String {
    case correctURL = "http://public.codesquad.kr/jk/weatherapp/customcell.json"
    case wrongURL = "http://public.codesquad.kr/jk/weatherapp/customce"
    case wrongResult = "result"
}
