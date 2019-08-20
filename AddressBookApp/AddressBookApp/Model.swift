 //
//  Model.swift
//  AddressBookApp
//
//  Created by joon-ho kil on 8/20/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import Foundation

 struct Model: MakeableCell {
    private let str = "[{\"date\":\"1월1일\", \"subtitle\":\"신정\"}, {\"date\":\"2월16일\", \"subtitle\":\"구정\"}, {\"date\":\"3월1일\", \"subtitle\":\"삼일절\"}, {\"date\":\"5월5일\", \"subtitle\":\"어린이날\"}, {\"date\":\"5월22일\", \"subtitle\":\"석가탄신일\"}, {\"date\":\"6월6일\", \"subtitle\":\"현충일\"}, {\"date\":\"8월15일\", \"subtitle\":\"광복절\"}, {\"date\":\"9월24일\", \"subtitle\":\"추석\"}, {\"date\":\"10월3일\", \"subtitle\":\"개천절\"}, {\"date\":\"10월9일\", \"subtitle\":\"한글날\"}, {\"date\":\"12월25일\", \"subtitle\":\"성탄절\"}]"
    
    private let json: [[String: String]]
    
    init() {
        if let data = str.data(using: .utf8), let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: String]] {
            self.json = json
            return
        }
        
        self.json = []
    }
    
    func getCellCount() -> Int {
        return json.count
    }
    
    func makeTextLabel(index: Int, handler: (String) -> ()) {
        handler(json[index][JsonFormat.date.rawValue]!)
    }
    
    func makeDetailTextLabel(index: Int, handler: (String) -> ()) {
        handler(json[index][JsonFormat.subtitle.rawValue]!)
    }
 }
