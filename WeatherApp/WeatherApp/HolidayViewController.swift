//
//  HolidayViewController.swift
//  WeatherApp
//
//  Created by kwangrae kim on 2019/11/19.
//  Copyright © 2019 elena. All rights reserved.
//

import UIKit

class HolidayViewController: UIViewController , UITableViewDataSource {
    
    //MARK: -IBOutlet
    @IBOutlet weak var holidayTable: UITableView!
    
    //MARK: -override
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: -UITableViewDataSource Add
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row)"
    
        
        return cell
    }
}
