//
//  BaseTableViewCell.swift
//  TestG
//
//  Created by Ostap Derkach on 21.01.2020.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell, Accessible {

    override func awakeFromNib() {
        super.awakeFromNib()
        generateAccessibilityIdentifiers()
        accessibilityIdentifier = "\(type(of: self))"
    }
}
