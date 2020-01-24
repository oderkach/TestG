//
//  Routable.swift
//  TestG
//
//  Created by Ostap Derkach on 21.01.2020.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

protocol Routable: Presentable {

    var rootRoutable: UINavigationController? { get }

    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool)

    func push(_ module: Presentable?)
    func push(_ module: Presentable?, animated: Bool)

    func dismissModule()
    func dismissModule(animated: Bool, completion: (() -> Void)?)

    func setRootModule(_ module: Presentable?)
}
