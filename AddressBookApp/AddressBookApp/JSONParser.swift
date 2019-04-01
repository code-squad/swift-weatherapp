//
//  JSONParser.swift
//  AddressBookApp
//
//  Created by 윤동민 on 01/04/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

struct JSONParser {
    static func getString(from url: String) -> String? {
        guard let url = URL(string: url) else { return nil }
        guard let content = try? String(contentsOf: url) else { return nil }
        return content
    }
    
    static func parseJSONData() -> [Dictionary<String, String>]? {
        let json = getString(from: "http://public.codesquad.kr/jk/weatherapp/customcell.json")
        let jsonData: Data? = json?.data(using: .utf8)
        guard let data = jsonData else { return nil }
        guard let convertedData = try? JSONSerialization.jsonObject(with: data, options: []) as? [Dictionary<String, String>] else { return nil }
        return convertedData
    }
}
