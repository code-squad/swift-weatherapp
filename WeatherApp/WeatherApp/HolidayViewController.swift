//
//  HolidayViewController.swift
//  WeatherApp
//
//  Created by hw on 30/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit

class HolidayViewController: UIViewController {
    let json = """
        [{"date":"1월1일", "subtitle":"신정"},
        {"date":"2월16일", "subtitle":"구정"},
        {"date":"3월1일", "subtitle":"삼일절"},
        {"date":"5월5일", "subtitle":"어린이날"},
        {"date":"5월22일", "subtitle":"석가탄신일"},
        {"date":"6월6일", "subtitle":"현충일"},
        {"date":"8월15일", "subtitle":"광복절"},
        {"date":"9월24일", "subtitle":"추석"},
        {"date":"10월3일", "subtitle":"개천절"},
        {"date":"10월9일", "subtitle":"한글날"},
        {"date":"12월25일", "subtitle":"성탄절"}]
    """
    @IBOutlet weak var holidayTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    
}
extension HolidayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
