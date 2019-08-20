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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        model.makeTextLabel(index: indexPath.row, handler: { (value)  in
            cell.textLabel?.text = value
        })
        
        model.makeDetailTextLabel(index: indexPath.row, handler: { (value)  in
            cell.detailTextLabel?.text = value
        })
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}
