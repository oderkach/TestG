// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery

@testable import TestG
import Foundation
import XCTest

final class BeerListPresenterLoadBeersTests: BeerListPresenterTests {
    private enum PresentLoadBeers {
        struct Given {
            let response: BeerList.LoadBeers.Response

            init(response: BeerList.LoadBeers.Response) {
                self.response = response
            }
        }

        struct Expected {
            let viewModel: BeerList.LoadBeers.ViewModel?
            let expectedNumberOfCalls: Int

            init(viewModel: BeerList.LoadBeers.ViewModel?,
                 expectedNumberOfCalls: Int = 1) {
                self.viewModel = viewModel
                self.expectedNumberOfCalls = expectedNumberOfCalls
            }
        }
    }

    // MARK: - Invocation

    private func invokePresentLoadBeers(with given: PresentLoadBeers.Given,
                                        displayMock: BeerListMocks.Display? = .none,
                                        expectation: XCTestExpectation? = .none,
                                        description: String = #function,
                                        file: StaticString = #file,
                                        line: UInt = #line) {
        setUpSuite(displayMock: displayMock,
                   expectation: expectation,
                   description: description)

        // WHEN
        sut.presentLoadBeers(given.response)

        // THEN
        waitForExpectations(timeout: 1) { (error) in
            XCTAssertNil(error, "Expectations are not fulfilled", file: file, line: line)
        }
    }

    // MARK: - Check method calls

    private func checkViewControllerDisplayLoadBeersCalls(expectedNumberOfCalls: Int,
                                                          file: StaticString,
                                                          line: UInt) -> BeerList.LoadBeers.ViewModel? {
        if expectedNumberOfCalls > 0 {
            // it called viewController.displayLoadBeers
            XCTAssertTrue(viewController.displayLoadBeersCalled, "expected to call viewController.displayLoadBeers", file: file, line: line)
        } else {
            // it never called viewController.displayLoadBeers
            XCTAssertFalse(viewController.displayLoadBeersCalled, "expected to never call viewController.displayLoadBeers", file: file, line: line)
        }

        // it called viewController.displayLoadBeers given number of times
        let actualNumberOfCalls = viewController.displayLoadBeersCallsCount
        XCTAssertEqual(actualNumberOfCalls, expectedNumberOfCalls, "expected to call viewController.displayLoadBeers \(expectedNumberOfCalls) times, but got \(actualNumberOfCalls) calls", file: file, line: line)

        return viewController.displayLoadBeersReceivedViewModel
    }

    // MARK: - Run test

    private func runTestPresentLoadBeers(given: PresentLoadBeers.Given,
                                         expected: PresentLoadBeers.Expected,
                                         displayMock: BeerListMocks.Display? = .none,
                                         expectation: XCTestExpectation? = .none,
                                         description: String = #function,
                                         file: StaticString = #file,
                                         line: UInt = #line) {
        // GIVEN
        let given = given

        // WHEN
        invokePresentLoadBeers(with: given,
                               displayMock: displayMock,
                               expectation: expectation,
                               description: description,
                               file: file,
                               line: line)

        // THEN
        //     Check ViewModel
        let actualViewControllerViewModel: BeerList.LoadBeers.ViewModel? = checkViewControllerDisplayLoadBeersCalls(expectedNumberOfCalls: expected.expectedNumberOfCalls, file: file, line: line)
        XCTAssertTrue(actualViewControllerViewModel == expected.viewModel, "expected passed viewModel to be \(String(describing: expected.viewModel)), but got \(String(describing: actualViewControllerViewModel))", file: file, line: line)
    }
}

// MARK: - Tests

extension BeerListPresenterLoadBeersTests {
    func testPresentLoadBeers_Success() {
        // GIVEN
        //     Response
        let beerA = Beer.mockA
        let beers = [beerA]
        let givenResponse: BeerList.LoadBeers.Response = .success(beers)
        let given = PresentLoadBeers.Given(response: givenResponse)

        // EXPECTED
        //     ViewModel
        let cellConfigurations = [BeerTableViewCell.Configuration.init(with: beerA)]
        let expectedViewControllerDisplayViewModel: BeerList.LoadBeers.ViewModel = .success(cellConfigurations)
        let expected: PresentLoadBeers.Expected = PresentLoadBeers.Expected(viewModel: expectedViewControllerDisplayViewModel)

        // TEST
        runTestPresentLoadBeers(given: given, expected: expected)
    }

    func testPresentLoadBeers_Failure() {
        // GIVEN
        //     Response
        let error = AppError.api(.explicitlyCancelled)
        let givenResponse: BeerList.LoadBeers.Response = .failure(error)
        let given = PresentLoadBeers.Given(response: givenResponse)

        // EXPECTED
        //     ViewModel
        let expectedViewControllerDisplayViewModel: BeerList.LoadBeers.ViewModel = .failure(error)
        let expected: PresentLoadBeers.Expected = PresentLoadBeers.Expected(viewModel: expectedViewControllerDisplayViewModel)

        // TEST
        runTestPresentLoadBeers(given: given, expected: expected)
    }
}
