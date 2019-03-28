//
//  HolidayViewController.swift
//  WeatherApp
//
//  Created by 조재흥 on 19. 3. 28..
//  Copyright © 2019 hngfu. All rights reserved.
//

import UIKit

class HolidayViewController: UIViewController {
    
    //MARK: - Properties
    //MARK: IBOutlet
    
    @IBOutlet weak var holidayTableView: UITableView!
    
    private var holidays = [[String: String]]()
    
    private let defaultCell = "defaultCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let strData = """
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
        guard let data = strData.data(using: String.Encoding.utf8, allowLossyConversion: false),
            let jsonData = try? JSONSerialization.jsonObject(with: data) as? Array<Dictionary<String,String>> else { return }
        holidays += jsonData
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HolidayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return holidays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: defaultCell, for: indexPath)
        
        let holiday = self.holidays[indexPath.row]
        cell.textLabel?.text = holiday["date"]
        cell.detailTextLabel?.text = holiday["subtitle"]
        
        return cell
    }
}
