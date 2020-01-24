// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery

@testable import TestG
import Foundation
import XCTest

class BeerListInteractorTests: XCTestCase {
    private(set) var sut: BeerListInteractor!
    private(set) var presenter: BeerListMocks.Presenter! {
        didSet {
            if let presenter = presenter, presenter === oldValue {
                presenter.promise = nextExpectation(for: presenter.promise)
            }
        }
    }

    private(set) var worker: BeerListMocks.Worker! {
        didSet {
            if let worker = worker, worker === oldValue {
                worker.promise = nextExpectation(for: worker.promise)
            }
        }
    }

    override func setUp() {
        super.setUp()
        cleanUp()
    }

    override func tearDown() {
        super.tearDown()
        cleanUp()
    }

    func cleanUp() {
        sut = .none
        presenter = .none
        worker = .none
    }

    func presenterMock(expectation: XCTestExpectation? = .none, description: String = #function) -> BeerListMocks.Presenter {
        let expectation = expectation ?? self.expectation(description: description + "_presenter")
        return BeerListMocks.Presenter(promise: expectation)
    }

    func workerMock(expectation: XCTestExpectation? = .none, description: String = #function) -> BeerListMocks.Worker {
        let expectation = expectation ?? self.expectation(description: description + "_worker")
        return BeerListMocks.Worker(promise: expectation)
    }

    @discardableResult
    func setUpSuite(presenterMock: BeerListMocks.Presenter? = .none,
                    workerMock: BeerListMocks.Worker? = .none,
                    expectation: XCTestExpectation? = .none,
                    description: String = #function) -> BeerListInteractor {
        let presenterMock = self.presenter ?? presenterMock ?? self.presenterMock(expectation: expectation, description: description)
        let workerMock = self.worker ?? workerMock ?? self.workerMock(expectation: expectation, description: description)

        let interactor = self.sut ?? BeerListInteractor(presenter: presenterMock,
                                                        worker: workerMock)

        self.sut = interactor
        self.presenter = presenterMock
        self.worker = workerMock

        return interactor
    }
}
