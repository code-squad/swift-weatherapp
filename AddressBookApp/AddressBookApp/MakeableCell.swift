//
//  drawableCell.swift
//  AddressBookApp
//
//  Created by joon-ho kil on 8/20/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import Foundation

protocol MakeableCell {
    func getCellCount() -> Int
    func makeDateLabel(index: Int, handler: (String) -> ())
    func makeSubtitleLabel(index: Int, handler: (String) -> ())
    func makeImage(index: Int, handler: (String) -> ())
}
