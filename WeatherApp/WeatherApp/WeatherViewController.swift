//
//  WeatherViewController.swift
//  
//
//  Created by 이동영 on 2019/11/19.
//

import UIKit
import SnapKit
import Then

class WeatherViewController: UITableViewController {
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    // MARK: - Configure
    private func configureTableView() {
        self.tableView.do {
            $0.rowHeight = UITableView.automaticDimension
            $0.separatorStyle = .none
            $0.register(DateTimeCell.self,
                        forCellReuseIdentifier: DateTimeCell.reuseIdentifier)
            $0.register(WeatherCell.self,
                        forCellReuseIdentifier: WeatherCell.reuseIdentifier)
        }
    }
}
// MARK: - Layout & Attribute
extension WeatherViewController {
    
}
// MARK: - Table view data source
extension WeatherViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return getDateTimeCell(for: indexPath)
        case 1:
            return getWeatherCell(for: indexPath)
        default:
            fatalError("TableCell is not configured.")
        }
    }
    
    private func getDateTimeCell(for indexPath: IndexPath) -> DateTimeCell {
        guard
            let cell = tableView.dequeueReusableCell(withType: DateTimeCell.self, for: indexPath)
            else { fatalError("DateTimeCell is not configured.") }
        
        cell.configure()
        return cell
    }
    
    private func getWeatherCell(for indexPath: IndexPath) -> WeatherCell {
        guard
            let cell = tableView.dequeueReusableCell(withType: WeatherCell.self, for: indexPath)
            else { fatalError("WeatherCell is not configured.") }
        
        cell.configure()
        return cell
    }
}
