//
//  TableView+.swift
//  WeatherApp
//
//  Created by 이동영 on 2019/11/19.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<Cell: Reuseable>(withType cellType: Cell.Type,
                                              for indexPath: IndexPath) -> Cell? {
        let cell = self.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath)
        
        return cell as? Cell
    }
}

