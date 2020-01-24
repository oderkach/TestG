//
//  BeerListWorker.swift
//  TestG
//
//  Created by Ostap Derkach on 23.01.2020.
//  Copyright (c) 2020 Test. All rights reserved.

// sourcery: AutoMockable, scene="BeerList"
protocol BeerListWorkerProtocol {
    func fetchBeers(pageSize: Int, pageNumber: Int, then: @escaping (Result<[Beer], AppError>) -> Void)
}

final class BeerListWorker: BeerListWorkerProtocol {
    func fetchBeers(pageSize: Int, pageNumber: Int, then: @escaping (Result<[Beer], AppError>) -> Void) {
        APIClient.Beers.getBeers(pageSize: pageSize, pageNumber: pageNumber) { response in
            then(response.result.map { $0 }.mapError(AppError.api))
        }
    }
}
