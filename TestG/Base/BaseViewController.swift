//
//  BaseViewController.swift
//  TestG
//
//  Created by Ostap Derkach on 21.01.2020.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, Accessible {

    // MARK: Setup

    func setupAccessibilityIdentifiers() {
        generateAccessibilityIdentifiers()
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAccessibilityIdentifiers()
    }
}
