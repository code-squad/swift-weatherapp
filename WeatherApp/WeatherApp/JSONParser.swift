//
//  JSONParser.swift
//  WeatherApp
//
//  Created by kwangrae kim on 2019/11/26.
//  Copyright © 2019 elena. All rights reserved.
//

import Foundation

struct JSONParser {
    
    static func getContestsFromURL(url: String) -> String? {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? String(contentsOf: url) else { return nil }
        return data
    }
    
    ///jsonData -> foundationData
    static func parseJSONData() -> Array<Dictionary<String,String>>? {
        let json = getContestsFromURL(url: "http://public.codesquad.kr/jk/weatherapp/customcell.json")
        guard let jsonData = json?.data(using: .utf8),
        let foundationData = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? Array<Dictionary<String,String>> else { return nil }
        return foundationData
    }
    
}
