//
//  HolidayViewController.swift
//  WeatherApp
//
//  Created by kwangrae kim on 2019/11/19.
//  Copyright © 2019 elena. All rights reserved.
//

import UIKit

class HolidayViewController: UIViewController , UITableViewDataSource {
    
    //MARK: -value
    private var holiday = Holidays()
    let idCell = "idCell"

    //MARK: -IBOutlet
    @IBOutlet weak var holidayTable: UITableView!
    
    //MARK: -override
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: -UITableViewDataSource Add
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let row = holiday?.count() else {
            return 0
        }
        return row
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell , for: indexPath)
        
        guard let holiday = self.holiday?.sendHoliday(index: indexPath.row) else {
            return cell
        }
        
        cell.textLabel?.text = holiday.data
        cell.detailTextLabel?.text = holiday.subtitle
        
        return cell
    }
}
