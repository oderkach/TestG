//
//  BeerListRouter.swift
//  TestG
//
//  Created by Ostap Derkach on 23.01.2020.
//  Copyright (c) 2020 Test. All rights reserved.

protocol BeerListRoutingLogic {
    func routeToNext()
}

protocol BeerListCoordinatorOutProtocol {
    func showNext(outputDataStore: BeerListOutDataStore)
}

final class BeerListRouter: BeerListRoutingLogic {
    private let outDataStore: BeerListOutDataStore
    private let coordinator: BeerListCoordinatorOutProtocol

    // MARK: Init

    init(outDataStore: BeerListOutDataStore,
         coordinator: BeerListCoordinatorOutProtocol) {
        self.outDataStore = outDataStore
        self.coordinator = coordinator
    }

    // MARK: Routing

    func routeToNext() {
        coordinator.showNext(outputDataStore: outDataStore)
    }
}
