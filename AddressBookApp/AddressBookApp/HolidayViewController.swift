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
        tableView.delegate = self
    }
    
    func parseJSONData() {
        let json = getStringFromURL()
        let jsonData: Data? = json?.data(using: .utf8)
        guard let data = jsonData else { return }
        guard let convertedData = try? JSONSerialization.jsonObject(with: data, options: []) as? [Dictionary<String, String>] else { return }
        dateEventInformation = convertedData
    }
    
    private func getStringFromURL() -> String? {
        guard let url = URL(string: "http://public.codesquad.kr/jk/weatherapp/customcell.json") else { return nil }
        guard let content = try? String(contentsOf: url) else { return nil }
        return content
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseQueue", for: indexPath) as! HolidayTableViewCell
        cell.dateLabel.text = dateEventInformation[indexPath.row]["date"]
        cell.subtitleLabel.text = dateEventInformation[indexPath.row]["subtitle"]
        
        let cellImageName = dateEventInformation[indexPath.row]["image"]
        switch cellImageName {
        case "sunny": cell.weatherImage.image = UIImage(named: "weather-sunny")
        case "cloudy": cell.weatherImage.image = UIImage(named: "weather-cloudy")
        case "snowy": cell.weatherImage.image = UIImage(named: "weather-snowy")
        case "rainny": cell.weatherImage.image = UIImage(named: "weather-rainny")
        default: cell.weatherImage.backgroundColor = UIColor.gray
        }
        return cell
    }
}

extension HolidayViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

