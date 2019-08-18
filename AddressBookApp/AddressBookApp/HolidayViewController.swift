//
//  HolidayViewController.swift
//  AddressBookApp
//
//  Created by joon-ho kil on 8/18/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import UIKit

class HolidayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let str = "[{\"date\":\"1월1일\", \"subtitle\":\"신정\"}, {\"date\":\"2월16일\", \"subtitle\":\"구정\"}, {\"date\":\"3월1일\", \"subtitle\":\"삼일절\"}, {\"date\":\"5월5일\", \"subtitle\":\"어린이날\"}, {\"date\":\"5월22일\", \"subtitle\":\"석가탄신일\"}, {\"date\":\"6월6일\", \"subtitle\":\"현충일\"}, {\"date\":\"8월15일\", \"subtitle\":\"광복절\"}, {\"date\":\"9월24일\", \"subtitle\":\"추석\"}, {\"date\":\"10월3일\", \"subtitle\":\"개천절\"}, {\"date\":\"10월9일\", \"subtitle\":\"한글날\"}, {\"date\":\"12월25일\", \"subtitle\":\"성탄절\"}]"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = str.data(using: .utf8) else {
            return 0
        }
        
        let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: String]]
    
        return json?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        guard let data = str.data(using: .utf8) else {
            return cell
        }
        
        let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: String]]
        cell.textLabel?.text = json?[indexPath.row]["date"]
        cell.detailTextLabel?.text = json?[indexPath.row]["subtitle"]
        
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}
