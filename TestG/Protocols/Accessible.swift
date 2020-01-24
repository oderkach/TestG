//
//  Accessible.swift
//  TestG
//
//  Created by Ostap Derkach on 21.01.2020.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

protocol Accessible {
    func generateAccessibilityIdentifiers()
    func generateAccessibilityIdentifiers(mirror: Mirror)
}

// generate automatic accessibilityIdentifiers for UITests
extension Accessible {
    func generateAccessibilityIdentifiers() {
        generateAccessibilityIdentifiers(mirror: Mirror(reflecting: self))
    }

    func generateAccessibilityIdentifiers(mirror: Mirror) {
        func setAi(accessible: UIAccessibilityIdentification, label: String?) {
            if accessible.accessibilityIdentifier == nil,
                let identifier = label?.replacingOccurrences(of: ".storage", with: "") {
                accessible.accessibilityIdentifier = "\(mirror.subjectType).\(identifier)"
            }
        }

        mirror.children.forEach { child in
            if let accessible = child.value as? UIView {
                setAi(accessible: accessible, label: child.label)
            } else if let accessible = child.value as? UIBarItem {
                setAi(accessible: accessible, label: child.label)
            }
        }

        if let superMirror = mirror.superclassMirror {
            generateAccessibilityIdentifiers(mirror: superMirror)
        }
    }
}
