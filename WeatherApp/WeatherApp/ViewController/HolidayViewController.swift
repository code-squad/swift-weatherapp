//
//  HolidayViewController.swift
//  WeatherApp
//
//  Created by 이동영 on 2019/11/19.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit

class HolidayViewController: UIViewController {

    private var holidays = [Holiday]()
    
    private func fetchDataSource() {
        guard
            let holidaysJSON = try? JSONSerialization.jsonObject(with: MyData.holiday) as? [[String: String]]
            else { return }
        
        for holiday in holidaysJSON {
            let date = holiday["date"]!
            let subTitle = holiday["subtitle"]!
            holidays.append(Holiday(date: date, subtitle: subTitle))
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
