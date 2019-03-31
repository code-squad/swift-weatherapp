//
//  Holidays.swift
//  WeatherApp
//
//  Created by 조재흥 on 19. 3. 28..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

struct Holidays {
    
    //MARK: - Properties
    //MARK: Private
    
    private var holidays = [Holiday]()
    
    private let urlString = "http://public.codesquad.kr/jk/weatherapp/customcell.json"
    
    //MARK: - Methods
    //MARK: Initialization
    
    init() {
        guard let url = URL(string: urlString),
            let data = try? Data(contentsOf: url),
            let newHolidays = try? JSONDecoder().decode([Holiday].self, from: data) else { return }
        self.holidays += newHolidays
    }
    
    //MARK: Subscript
    
    subscript(index: Int) -> Holiday? {
        get {
            guard 0 <= index && index < holidays.count else { return nil }
            return holidays[index]
        }
    }
    
    //MARK: Instance
    
    func count() -> Int {
        return holidays.count
    }
}
