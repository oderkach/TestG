// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery

@testable import TestG
import Foundation
import XCTest

final class BeerListPresenterLoadMoreBeersTests: BeerListPresenterTests {
    private enum PresentLoadMoreBeers {
        struct Given {
            let response: BeerList.LoadMoreBeers.Response

            init(response: BeerList.LoadMoreBeers.Response) {
                self.response = response
            }
        }

        struct Expected {
            let viewModel: BeerList.LoadMoreBeers.ViewModel?
            let expectedNumberOfCalls: Int

            init(viewModel: BeerList.LoadMoreBeers.ViewModel?,
                 expectedNumberOfCalls: Int = 1) {
                self.viewModel = viewModel
                self.expectedNumberOfCalls = expectedNumberOfCalls
            }
        }
    }

    // MARK: - Invocation

    private func invokePresentLoadMoreBeers(with given: PresentLoadMoreBeers.Given,
                                            displayMock: BeerListMocks.Display? = .none,
                                            expectation: XCTestExpectation? = .none,
                                            description: String = #function,
                                            file: StaticString = #file,
                                            line: UInt = #line) {
        setUpSuite(displayMock: displayMock,
                   expectation: expectation,
                   description: description)

        // WHEN
        sut.presentLoadMoreBeers(given.response)

        // THEN
        waitForExpectations(timeout: 1) { (error) in
            XCTAssertNil(error, "Expectations are not fulfilled", file: file, line: line)
        }
    }

    // MARK: - Check method calls

    private func checkViewControllerDisplayLoadMoreBeersCalls(expectedNumberOfCalls: Int,
                                                              file: StaticString,
                                                              line: UInt) -> BeerList.LoadMoreBeers.ViewModel? {
        if expectedNumberOfCalls > 0 {
            // it called viewController.displayLoadMoreBeers
            XCTAssertTrue(viewController.displayLoadMoreBeersCalled, "expected to call viewController.displayLoadMoreBeers", file: file, line: line)
        } else {
            // it never called viewController.displayLoadMoreBeers
            XCTAssertFalse(viewController.displayLoadMoreBeersCalled, "expected to never call viewController.displayLoadMoreBeers", file: file, line: line)
        }

        // it called viewController.displayLoadMoreBeers given number of times
        let actualNumberOfCalls = viewController.displayLoadMoreBeersCallsCount
        XCTAssertEqual(actualNumberOfCalls, expectedNumberOfCalls, "expected to call viewController.displayLoadMoreBeers \(expectedNumberOfCalls) times, but got \(actualNumberOfCalls) calls", file: file, line: line)

        return viewController.displayLoadMoreBeersReceivedViewModel
    }

    // MARK: - Run test

    private func runTestPresentLoadMoreBeers(given: PresentLoadMoreBeers.Given,
                                             expected: PresentLoadMoreBeers.Expected,
                                             displayMock: BeerListMocks.Display? = .none,
                                             expectation: XCTestExpectation? = .none,
                                             description: String = #function,
                                             file: StaticString = #file,
                                             line: UInt = #line) {
        // GIVEN
        let given = given

        // WHEN
        invokePresentLoadMoreBeers(with: given,
                                   displayMock: displayMock,
                                   expectation: expectation,
                                   description: description,
                                   file: file,
                                   line: line)

        // THEN
        //     Check ViewModel
        let actualViewControllerViewModel: BeerList.LoadMoreBeers.ViewModel? = checkViewControllerDisplayLoadMoreBeersCalls(expectedNumberOfCalls: expected.expectedNumberOfCalls, file: file, line: line)
        XCTAssertTrue(actualViewControllerViewModel == expected.viewModel, "expected passed viewModel to be \(String(describing: expected.viewModel)), but got \(String(describing: actualViewControllerViewModel))", file: file, line: line)
    }
}

// MARK: - Tests

extension BeerListPresenterLoadMoreBeersTests {
    func testPresentLoadMoreBeers_Success() {
        // GIVEN
        let beer = Beer.mock
        let beerA = Beer.mockA
        let beers = [beer, beerA]
        //     Response
        let givenResponse: BeerList.LoadMoreBeers.Response = .success(beers)
        let given = PresentLoadMoreBeers.Given(response: givenResponse)

        // EXPECTED
        //     ViewModel
        let cellConfigurations: [BeerTableViewCell.Configuration] = [.init(with: beer),
                                                                     .init(with: beerA)]
        let expectedViewControllerDisplayViewModel: BeerList.LoadMoreBeers.ViewModel = .success(cellConfigurations)
        let expected: PresentLoadMoreBeers.Expected = PresentLoadMoreBeers.Expected(viewModel: expectedViewControllerDisplayViewModel)

        // TEST
        runTestPresentLoadMoreBeers(given: given, expected: expected)
    }

    func testPresentLoadMoreBeers_Failure() {
        // GIVEN
        let error = AppError.api(.explicitlyCancelled)
        //     Response
        let givenResponse: BeerList.LoadMoreBeers.Response = .failure(error)
        let given = PresentLoadMoreBeers.Given(response: givenResponse)

        // EXPECTED
        //     ViewModel
        let expectedViewControllerDisplayViewModel: BeerList.LoadMoreBeers.ViewModel = .failure(error)
        let expected: PresentLoadMoreBeers.Expected = PresentLoadMoreBeers.Expected(viewModel: expectedViewControllerDisplayViewModel)

        // TEST
        runTestPresentLoadMoreBeers(given: given, expected: expected)
    }
}
