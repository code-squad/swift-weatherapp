//
//  Constant.swift
//  WeatherApp
//
//  Created by 이동영 on 2019/11/19.
//  Copyright © 2019 이동영. All rights reserved.
//

import Foundation

enum MyData {

    static let url =  Bundle.main.url(forResource: "Holidays", withExtension: "json")!
    static let holiday = try! String(contentsOf: url).data(using: .utf8)!
}
