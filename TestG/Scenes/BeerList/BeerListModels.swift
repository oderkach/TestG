//
//  BeerListModels.swift
//  TestG
//
//  Created by Ostap Derkach on 23.01.2020.
//  Copyright (c) 2020 Test. All rights reserved.

enum BeerList {

    enum OutResult: Equatable {
    }

    // MARK: Use cases

    // sourcery: useCase, worker="fetchBeers"
    enum LoadBeers {}

    // sourcery: useCase, worker="fetchBeers"
    enum LoadMoreBeers {}
}

extension BeerList.LoadBeers {
    typealias Request = Void

    typealias Response = Result<[Beer], AppError>

    // may be viewController friendly error instead of AppError
    typealias ViewModel = Result<[BeerTableViewCell.Configuration], AppError>
}

extension BeerList.LoadMoreBeers {
    typealias Request = Void

    typealias Response = Result<[Beer], AppError>

    // may be viewController friendly error instead of AppError
    typealias ViewModel = Result<[BeerTableViewCell.Configuration], AppError>
}
