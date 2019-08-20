 //
//  Model.swift
//  AddressBookApp
//
//  Created by joon-ho kil on 8/20/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import Foundation

 struct Model: MakeableCell {
    private let url = URL(string: "http://public.codesquad.kr/jk/weatherapp/customcell.json")!
    private let json: [[String: String]]
    
    init() {
        do {
            let jsonString = try String(contentsOf: url)
            
            if let data = jsonString.data(using: .utf8), let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: String]] {
                self.json = json
                return
            }
        } catch {
            print("error")
        }
        
        self.json = []
    }
    
    func getCellCount() -> Int {
        return json.count
    }
    
    func makeDateLabel(index: Int, handler: (String) -> ()) {
        handler(json[index][JsonFormat.date.rawValue] ?? "")
    }
    
    func makeSubtitleLabel(index: Int, handler: (String) -> ()) {
        handler(json[index][JsonFormat.subtitle.rawValue] ?? "")
    }
    
    func makeImage(index: Int, handler: (String) -> ()) {
        handler(json[index][JsonFormat.image.rawValue] ?? "")
    }
 }
