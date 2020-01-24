//
//  String+Localizable.swift
//  TestG
//
//  Created by Ostap Derkach on 23.01.2020.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

extension String {
    static func localizeText(_ value: Localizable) -> String {
        return NSLocalizedString(value.rawValue, comment: "")
    }
}
