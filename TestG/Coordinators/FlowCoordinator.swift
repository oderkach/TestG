//
//  FlowCoordinator.swift
//  TestG
//
//  Created by Ostap Derkach on 21.01.2020.
//  Copyright © 2020 Test. All rights reserved.
//

final class FlowCoordinator: Coordinator {

    private let router: Routable

    // MARK: Init

    init(router: Routable) {
        self.router = router
    }

    // MARK: Flow

    func start() {
        let berrListViewController = BeerList.Assembly.createModule(coordinator: self)
        router.setRootModule(berrListViewController)
    }
}

// MARK: BeerListCoordinatorOutProtocol

extension FlowCoordinator: BeerListCoordinatorOutProtocol {
    func showNext(outputDataStore: BeerListOutDataStore) {
        // handle showNext
    }
}
