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
    
    private var dateEvent: DateEvent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dateEvent = DateEvent()
        guard let information = JSONParser.parseJSONData() else { return }
        dateEvent?.set(information: information)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension HolidayViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateEvent?.count() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseQueue", for: indexPath) as! HolidayTableViewCell
        
        dateEvent?.access { information in
            cell.dateLabel.text = information[indexPath.row]["date"]
            cell.subtitleLabel.text = information[indexPath.row]["subtitle"]
            cell.chooseImage(name: information[indexPath.row]["image"])
        }
        return cell
    }
}

extension HolidayViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

