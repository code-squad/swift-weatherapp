//
//  HolidayViewController.swift
//  AddressBookApp
//
//  Created by joon-ho kil on 8/18/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import UIKit

class HolidayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    let model = Model()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getCellCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "holidaycustom", for: indexPath) as! HolidayTableViewCell
        
        model.makeDateLabel(index: indexPath.row, handler: { (value)  in
            cell.dateLabel.text = value
        })
        
        model.makeSubtitleLabel(index: indexPath.row, handler: { (value)  in
            cell.subtitleLabel.text = value
        })
        
        model.makeImage(index: indexPath.row, handler: { (imageName)  in
            cell.weatherImage.image = UIImage(named: imageName)
        })
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}
