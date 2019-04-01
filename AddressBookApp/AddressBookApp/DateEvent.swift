//
//  DateEvent.swift
//  AddressBookApp
//
//  Created by 윤동민 on 01/04/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

class DateEvent {
    private var information: [Dictionary<String, String>]?
    
    func set(information: [Dictionary<String, String>]) {
        self.information = information
    }
    
    func access(form: ([Dictionary<String, String>]) -> Void) {
        guard let information = self.information else { return }
        form(information)
    }
    
    func count() -> Int {
        guard let information = self.information else { return 0 }
        return information.count
    }
}
