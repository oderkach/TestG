//
//  BeerListInteractor.swift
//  TestG
//
//  Created by Ostap Derkach on 23.01.2020.
//  Copyright (c) 2020 Test. All rights reserved.

// sourcery: AutoMockable, scene="BeerList"
protocol BeerListBusinessLogic {
    func requestLoadBeers(_ request: BeerList.LoadBeers.Request)
    func requestLoadMoreBeers(_ request: BeerList.LoadMoreBeers.Request)
}

protocol BeerListOutDataStore {
    var outResult: BeerList.OutResult? { get }
}

// sourcery: Interactor
final class BeerListInteractor: BeerListBusinessLogic, BeerListOutDataStore {

    private let presenter: BeerListPresentationLogic
    private let worker: BeerListWorkerProtocol

    private let pageSize = 20
    private var pageToLoad = 1

    // MARK: BeerListOutDataStore

    private(set) var outResult: BeerList.OutResult?

    // MARK: Init

    init(presenter: BeerListPresentationLogic,
         worker: BeerListWorkerProtocol) {
        self.presenter = presenter
        self.worker = worker
    }

    // MARK: VIP cycle

    func requestLoadBeers(_ request: BeerList.LoadBeers.Request) {
        worker.fetchBeers(pageSize: pageSize, pageNumber: pageToLoad) { [weak self] response in
            guard let self = self else { return }

            if case Result.success = response.result {
                self.pageToLoad += 1
            }
            self.presenter.presentLoadBeers(response)
        }
    }

    func requestLoadMoreBeers(_ request: BeerList.LoadMoreBeers.Request) {
        worker.fetchBeers(pageSize: pageSize, pageNumber: pageToLoad) { [weak self] response in
            guard let self = self else { return }

            if case Result.success = response.result {
                self.pageToLoad += 1
            }
            self.presenter.presentLoadMoreBeers(response)
        }
    }
}
