// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery

@testable import TestG
import Foundation
import XCTest

class BeerListPresenterTests: XCTestCase {
    private(set) var sut: BeerListPresenter!
    private(set) var viewController: BeerListMocks.Display! {
        didSet {
            if let viewController = viewController, viewController === oldValue {
                viewController.promise = nextExpectation(for: viewController.promise)
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
        viewController = .none
    }

    func displayMock(expectation: XCTestExpectation? = .none, description: String = #function) -> BeerListMocks.Display {
        let expectation = expectation ?? self.expectation(description: description + "_display")
        return BeerListMocks.Display(promise: expectation)
    }

    @discardableResult
    func setUpSuite(displayMock: BeerListMocks.Display? = .none,
                    expectation: XCTestExpectation? = .none,
                    description: String = #function) -> BeerListPresenter {
        let displayMock = self.viewController ?? displayMock ?? self.displayMock(expectation: expectation, description: description)

        let presenter = self.sut ?? BeerListPresenter(viewController: displayMock)

        self.sut = presenter
        self.viewController = displayMock

        return presenter
    }
}
