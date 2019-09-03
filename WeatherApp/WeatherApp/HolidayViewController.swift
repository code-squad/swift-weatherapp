//
//  HolidayViewController.swift
//  WeatherApp
//
//  Created by hw on 30/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit

class HolidayViewController: UIViewController {
    private var holidayList: HolidayList!
    @IBOutlet weak var holidayTableView: UITableView!
    
    func configureModel(holidayList: HolidayList) {
        if self.holidayList == nil {
            self.holidayList = holidayList
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(alertErrorMessage), name: .networkError, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if holidayList == nil {
             holidayList = HolidayList.init()
        }
    }

    @objc func alertErrorMessage(_ notification: Notification){
        guard let userInfo = notification.userInfo as? [String: Error],
              let error = userInfo["result"] else {
            return
        }
        let alertController = UIAlertController.init(title: SystemErrorMessage.networkError.rawValue,
                                                     message: "\(SystemErrorMessage.detailMessage.rawValue)\(error.localizedDescription)",
                                                     preferredStyle: .alert)
        let retryAction = buildRetryAction()
        let defaultExitAction = buildDefaultExitAction()
        alertController.addAction(retryAction)
        alertController.addAction(defaultExitAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func buildDefaultExitAction() -> UIAlertAction {
        let defaultExitAction = UIAlertAction.init(title: ButtonMessage.exit.description, style: .destructive) { (exit: UIAlertAction) in
            if exit.isEnabled{
                UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
            }
        }
        return defaultExitAction
    }
    
    private func buildRetryAction() -> UIAlertAction {
        let retryAction = UIAlertAction.init(title: ButtonMessage.retry.description, style: .default) { (retry: UIAlertAction) in
            if retry.isEnabled {
                self.retryNetworkReceive()
                DispatchQueue.main.async {
                    self.holidayTableView.reloadData()
                }
            }
        }
        return retryAction
    }
    
    private func retryNetworkReceive(){
        holidayList = HolidayList.init(true)
    }
}

extension HolidayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let format = { (count: Int) in
            return count
        }
        guard holidayList != nil else {
            return 0
        }
        let count = holidayList.receiveTableViewCountFormat(format: format)
        return  count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: ReusableCellInfo.holidayCustomCell.rawValue) as? HolidayTableViewCell else {
            return HolidayTableViewCell()
        }
        cell.backgroundView?.clearsContextBeforeDrawing = true
        holidayList.receiveTableViewContentFormat(format: cell.tableViewContentFormat, rowAt: indexPath.row)
        return cell
    }
}


