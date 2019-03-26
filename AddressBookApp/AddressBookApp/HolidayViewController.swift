//
//  HolidayViewController.swift
//  AddressBookApp
//
//  Created by 윤동민 on 26/03/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class HolidayViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var dateEventInformation: [Dictionary<String, String>]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        parseJSONData()
        tableView.dataSource = self
    }
    
    func parseJSONData() {
        let json = """
                    [{\"date\":\"1월1일\", \"subtitle\":\"신정\"},
                    {\"date\":\"2월16일\", \"subtitle\":\"구정\"},
                    {\"date\":\"3월1일\", \"subtitle\":\"삼일절\"},
                    {\"date\":\"5월5일\", \"subtitle\":\"어린이날\"},
                    {\"date\":\"5월22일\", \"subtitle\":\"석가탄신일\"},
                    {\"date\":\"6월6일\", \"subtitle\":\"현충일\"},
                    {\"date\":\"8월15일\", \"subtitle\":\"광복절\"},
                    {\"date\":\"9월24일\", \"subtitle\":\"추석\"},
                    {\"date\":\"10월3일\", \"subtitle\":\"개천절\"},
                    {\"date\":\"10월9일\", \"subtitle\":\"한글날\"},
                    {\"date\":\"12월25일\", \"subtitle\":\"성탄절\"}]
                    """
        
        let jsonData: Data? = json.data(using: .utf8)
        guard let data = jsonData else { return }
        guard let convertedData = try? JSONSerialization.jsonObject(with: data, options: []) as? [Dictionary<String, String>] else { return }
        dateEventInformation = convertedData
    }
    
}

extension HolidayViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateEventInformation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: "reuseQueue") { cell = reuseCell }
        else { cell = UITableViewCell(style: .subtitle, reuseIdentifier: "reuseQueue") }
        
        cell.textLabel?.text = dateEventInformation[indexPath.row]["date"]
        cell.detailTextLabel?.text = dateEventInformation[indexPath.row]["subtitle"]
        return cell
    }
}

