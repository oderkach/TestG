// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery

@testable import TestG
import Foundation
import XCTest

enum BeerListMocks {}

extension BeerListMocks {
    final class Interactor: BeerListBusinessLogic {
        var promise: XCTestExpectation

        init(promise: XCTestExpectation) {
            self.promise = promise
        }

        // MARK: - requestLoadBeers

        var requestLoadBeersCallsCount = 0
        var requestLoadBeersCalled: Bool {
            return requestLoadBeersCallsCount > 0
        }

        var requestLoadBeersReceivedRequest: BeerList.LoadBeers.Request?
        var requestLoadBeersReceivedInvocations: [BeerList.LoadBeers.Request] = []
        var requestLoadBeersClosure: ((BeerList.LoadBeers.Request) -> Void)?

        func requestLoadBeers(_ request: BeerList.LoadBeers.Request) {
            requestLoadBeersCallsCount += 1
            requestLoadBeersReceivedRequest = request
            requestLoadBeersReceivedInvocations.append(request)
            requestLoadBeersClosure?(request)
            promise.fulfill()
        }

        // MARK: - requestLoadMoreBeers

        var requestLoadMoreBeersCallsCount = 0
        var requestLoadMoreBeersCalled: Bool {
            return requestLoadMoreBeersCallsCount > 0
        }

        var requestLoadMoreBeersReceivedRequest: BeerList.LoadMoreBeers.Request?
        var requestLoadMoreBeersReceivedInvocations: [BeerList.LoadMoreBeers.Request] = []
        var requestLoadMoreBeersClosure: ((BeerList.LoadMoreBeers.Request) -> Void)?

        func requestLoadMoreBeers(_ request: BeerList.LoadMoreBeers.Request) {
            requestLoadMoreBeersCallsCount += 1
            requestLoadMoreBeersReceivedRequest = request
            requestLoadMoreBeersReceivedInvocations.append(request)
            requestLoadMoreBeersClosure?(request)
            promise.fulfill()
        }
    }
}

extension BeerListMocks {
    final class Display: BeerListDisplayLogic {
        var promise: XCTestExpectation

        init(promise: XCTestExpectation) {
            self.promise = promise
        }

        // MARK: - displayLoadBeers

        var displayLoadBeersCallsCount = 0
        var displayLoadBeersCalled: Bool {
            return displayLoadBeersCallsCount > 0
        }

        var displayLoadBeersReceivedViewModel: BeerList.LoadBeers.ViewModel?
        var displayLoadBeersReceivedInvocations: [BeerList.LoadBeers.ViewModel] = []
        var displayLoadBeersClosure: ((BeerList.LoadBeers.ViewModel) -> Void)?

        func displayLoadBeers(_ viewModel: BeerList.LoadBeers.ViewModel) {
            displayLoadBeersCallsCount += 1
            displayLoadBeersReceivedViewModel = viewModel
            displayLoadBeersReceivedInvocations.append(viewModel)
            displayLoadBeersClosure?(viewModel)
            promise.fulfill()
        }

        // MARK: - displayLoadMoreBeers

        var displayLoadMoreBeersCallsCount = 0
        var displayLoadMoreBeersCalled: Bool {
            return displayLoadMoreBeersCallsCount > 0
        }

        var displayLoadMoreBeersReceivedViewModel: BeerList.LoadMoreBeers.ViewModel?
        var displayLoadMoreBeersReceivedInvocations: [BeerList.LoadMoreBeers.ViewModel] = []
        var displayLoadMoreBeersClosure: ((BeerList.LoadMoreBeers.ViewModel) -> Void)?

        func displayLoadMoreBeers(_ viewModel: BeerList.LoadMoreBeers.ViewModel) {
            displayLoadMoreBeersCallsCount += 1
            displayLoadMoreBeersReceivedViewModel = viewModel
            displayLoadMoreBeersReceivedInvocations.append(viewModel)
            displayLoadMoreBeersClosure?(viewModel)
            promise.fulfill()
        }
    }
}

extension BeerListMocks {
    final class Presenter: BeerListPresentationLogic {
        var promise: XCTestExpectation

        init(promise: XCTestExpectation) {
            self.promise = promise
        }

        // MARK: - presentLoadBeers

        var presentLoadBeersCallsCount = 0
        var presentLoadBeersCalled: Bool {
            return presentLoadBeersCallsCount > 0
        }

        var presentLoadBeersReceivedResponse: BeerList.LoadBeers.Response?
        var presentLoadBeersReceivedInvocations: [BeerList.LoadBeers.Response] = []
        var presentLoadBeersClosure: ((BeerList.LoadBeers.Response) -> Void)?

        func presentLoadBeers(_ response: BeerList.LoadBeers.Response) {
            presentLoadBeersCallsCount += 1
            presentLoadBeersReceivedResponse = response
            presentLoadBeersReceivedInvocations.append(response)
            presentLoadBeersClosure?(response)
            promise.fulfill()
        }

        // MARK: - presentLoadMoreBeers

        var presentLoadMoreBeersCallsCount = 0
        var presentLoadMoreBeersCalled: Bool {
            return presentLoadMoreBeersCallsCount > 0
        }

        var presentLoadMoreBeersReceivedResponse: BeerList.LoadMoreBeers.Response?
        var presentLoadMoreBeersReceivedInvocations: [BeerList.LoadMoreBeers.Response] = []
        var presentLoadMoreBeersClosure: ((BeerList.LoadMoreBeers.Response) -> Void)?

        func presentLoadMoreBeers(_ response: BeerList.LoadMoreBeers.Response) {
            presentLoadMoreBeersCallsCount += 1
            presentLoadMoreBeersReceivedResponse = response
            presentLoadMoreBeersReceivedInvocations.append(response)
            presentLoadMoreBeersClosure?(response)
            promise.fulfill()
        }
    }
}

extension BeerListMocks {
    final class Worker: BeerListWorkerProtocol {
        var promise: XCTestExpectation

        init(promise: XCTestExpectation) {
            self.promise = promise
        }

        // MARK: - fetchBeers

        var fetchBeersPageSizePageNumberThenCallsCount = 0
        var fetchBeersPageSizePageNumberThenCalled: Bool {
            return fetchBeersPageSizePageNumberThenCallsCount > 0
        }

        var fetchBeersPageSizePageNumberThenReceivedArguments: (pageSize: Int, pageNumber: Int, then: (Result<[Beer], AppError>) -> Void)?
        var fetchBeersPageSizePageNumberThenReceivedInvocations: [(pageSize: Int, pageNumber: Int, then: (Result<[Beer], AppError>) -> Void)] = []
        var fetchBeersPageSizePageNumberThenClosure: ((Int, Int, @escaping (Result<[Beer], AppError>) -> Void) -> Void)?

        func fetchBeers(pageSize: Int, pageNumber: Int, then: @escaping (Result<[Beer], AppError>) -> Void) {
            fetchBeersPageSizePageNumberThenCallsCount += 1
            fetchBeersPageSizePageNumberThenReceivedArguments = (pageSize: pageSize, pageNumber: pageNumber, then: then)
            fetchBeersPageSizePageNumberThenReceivedInvocations.append((pageSize: pageSize, pageNumber: pageNumber, then: then))
            fetchBeersPageSizePageNumberThenClosure?(pageSize, pageNumber, then)
            promise.fulfill()
        }
    }
}
