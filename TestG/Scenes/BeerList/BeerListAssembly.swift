//
//  BeerListAssembly.swift
//  TestG
//
//  Created by Ostap Derkach on 23.01.2020.
//  Copyright (c) 2020 Test. All rights reserved.

import UIKit

extension BeerList {
    enum Assembly {}
}

extension BeerList.Assembly {

    static func createModule(worker: BeerListWorkerProtocol = BeerListWorker(),
                             coordinator: BeerListCoordinatorOutProtocol) -> UIViewController {
        let viewController = StoryboardScene.BeerList.beerListViewController.instantiate()
        let presenter = BeerListPresenter(viewController: viewController)

        let interactor = BeerListInteractor(presenter: presenter, worker: worker)

        let router = BeerListRouter(outDataStore: interactor, coordinator: coordinator)

        viewController.setDependencies(interactor: interactor, router: router)

        return viewController
    }
}
