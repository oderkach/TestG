//
//  BeerListPresenter.swift
//  TestG
//
//  Created by Ostap Derkach on 23.01.2020.
//  Copyright (c) 2020 Test. All rights reserved.

// sourcery: AutoMockable, scene="BeerList"
protocol BeerListPresentationLogic {
    func presentLoadBeers(_ response: BeerList.LoadBeers.Response)
    func presentLoadMoreBeers(_ response: BeerList.LoadMoreBeers.Response)
}

// sourcery: Presenter
final class BeerListPresenter: BeerListPresentationLogic {

    private weak var viewController: BeerListDisplayLogic?

    // MARK: Init

    init(viewController: BeerListDisplayLogic) {
        self.viewController = viewController
    }

    // MARK: VIP cycle

    func presentLoadBeers(_ response: BeerList.LoadBeers.Response) {
        viewController?.displayLoadBeers(response.result
            .map { $0.map { BeerTableViewCell.Configuration(with: $0) } })
    }

    func presentLoadMoreBeers(_ response: BeerList.LoadMoreBeers.Response) {
        viewController?.displayLoadMoreBeers(response.result
            .map { $0.map { BeerTableViewCell.Configuration(with: $0) } })
    }
}
