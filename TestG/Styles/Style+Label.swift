//
//  Style+Label.swift
//  TestG
//
//  Created by Ostap Derkach on 21.01.2020.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

extension Style {
    enum Label {}
}

extension Style.Label {

    // MARK: Color

    static func primaryColor(_ label: UILabel) {
        label.textColor = .primaryTextColor
    }

    static func secondaryColor(_ label: UILabel) {
        label.textColor = .secondaryTextColor
    }

    static func tertiaryColor(_ label: UILabel) {
        label.textColor = .tertiaryTextColor
    }

    // MARK: Color & Font

    static func cellTitle(_ label: UILabel) {
        primaryColor(label)
        label.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
    }

    static func cellTitle1(_ label: UILabel) {
        secondaryColor(label)
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
    }

    static func cellDescription(_ label: UILabel) {
        tertiaryColor(label)
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
    }
}
