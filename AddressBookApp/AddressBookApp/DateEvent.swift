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
}
