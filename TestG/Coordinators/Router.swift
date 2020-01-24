//
//  Router.swift
//  TestG
//
//  Created by Ostap Derkach on 21.01.2020.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

class Router {

    private weak var rootController: UINavigationController?

    init(rootController: UINavigationController) {
        self.rootController = rootController
    }
}

// MARK: - Routable

extension Router: Routable {

    var toPresent: UIViewController? {
        return rootController
    }

    var rootRoutable: UINavigationController? {
        return rootController
    }

    func present(_ module: Presentable?) {
        present(module, animated: true)
    }

    func present(_ module: Presentable?, animated: Bool) {
        guard let controller = module?.toPresent else { return }
        rootController?.present(controller, animated: animated, completion: nil)
    }

    func push(_ module: Presentable?) {
        push(module, animated: true)
    }

    func push(_ module: Presentable?, animated: Bool) {
        guard let controller = module?.toPresent,
            (controller is UINavigationController == false) else {
                assertionFailure("Deprecated push UINavigationController.")
                return
        }
        rootController?.pushViewController(controller, animated: animated)
    }

    func popModule() {
        popModule(animated: true)
    }

    func popModule(animated: Bool) {
        rootController?.popViewController(animated: animated)
    }

    func popToRootModule(animated: Bool) {
        rootController?.popToRootViewController(animated: animated)
    }

    func dismissModule() {
        dismissModule(animated: true, completion: nil)
    }

    func dismissModule(animated: Bool, completion: (() -> Void)?) {
        rootController?.dismiss(animated: animated, completion: completion)
    }

    func setRootModule(_ module: Presentable?) {
        guard let controller = module?.toPresent else { return }
        rootController?.setViewControllers([controller], animated: false)
    }
}
