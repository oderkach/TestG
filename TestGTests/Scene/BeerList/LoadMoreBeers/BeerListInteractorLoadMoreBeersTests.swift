// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery

@testable import TestG
import Foundation
import XCTest

final class BeerListInteractorLoadMoreBeersTests: BeerListInteractorTests {
    private typealias WorkerGivenResultStubParameterType = Result<[Beer], AppError>
    private typealias WorkerExpectedIncomingParameterType = (Int, Int)

    private enum RequestLoadMoreBeers {
        struct Given {
            let request: BeerList.LoadMoreBeers.Request
            let workerParameter: WorkerGivenResultStubParameterType

            init(request: BeerList.LoadMoreBeers.Request,
                 workerParameter: WorkerGivenResultStubParameterType) {
                self.request = request
                self.workerParameter = workerParameter
            }
        }

        struct Expected {
            let response: BeerList.LoadMoreBeers.Response?
            let expectedNumberOfCalls: Int
            let workerParameter: WorkerExpectedIncomingParameterType?
            let expectedNumberOfWorkerCalls: Int
            let output: BeerList.OutResult?

            init(response: BeerList.LoadMoreBeers.Response?,
                 expectedNumberOfCalls: Int = 1,
                 workerParameter: WorkerExpectedIncomingParameterType?,
                 expectedNumberOfWorkerCalls: Int = 1,
                 output: BeerList.OutResult?) {
                self.response = response
                self.expectedNumberOfCalls = expectedNumberOfCalls
                self.workerParameter = workerParameter
                self.expectedNumberOfWorkerCalls = expectedNumberOfWorkerCalls
                self.output = output
            }
        }
    }

    // MARK: - Setup

    private func setUpWorker(_ resultStub: WorkerGivenResultStubParameterType, expectedNumberOfCalls: Int) {
        worker.fetchBeersPageSizePageNumberThenClosure = { (_, _, callback) in callback(resultStub) }
        if expectedNumberOfCalls <= 0 {
            // Worker is not expected to be called
            worker.promise.fulfill()
        }
        if expectedNumberOfCalls <= 0 {
            // Worker is not expected to be called
            worker.promise.fulfill()
        }
    }

    // MARK: - Invocation

    private func invokeRequestLoadMoreBeers(with given: RequestLoadMoreBeers.Given,
                                            presenterMock: BeerListMocks.Presenter? = .none,
                                            workerMock: BeerListMocks.Worker? = .none,
                                            expectedNumberOfWorkerCalls: Int,
                                            expectation: XCTestExpectation? = .none,
                                            description: String = #function,
                                            file: StaticString = #file,
                                            line: UInt = #line) {
        setUpSuite(presenterMock: presenterMock,
                   workerMock: workerMock,
                   expectation: expectation,
                   description: description)

        setUpWorker(given.workerParameter, expectedNumberOfCalls: expectedNumberOfWorkerCalls)

        // WHEN
        sut.requestLoadMoreBeers(given.request)

        // THEN
        waitForExpectations(timeout: 1) { (error) in
            XCTAssertNil(error, "Expectations are not fulfilled", file: file, line: line)
        }
    }

    // MARK: - Check method calls

    private func checkPresenterPresentLoadMoreBeersCalls(expectedNumberOfCalls: Int,
                                                         file: StaticString,
                                                         line: UInt) -> BeerList.LoadMoreBeers.Response? {
        if expectedNumberOfCalls > 0 {
            // it called presenter.presentLoadMoreBeers
            XCTAssertTrue(presenter.presentLoadMoreBeersCalled, "expected to call presenter.presentLoadMoreBeers", file: file, line: line)
        } else {
            // it never called presenter.presentLoadMoreBeers
            XCTAssertFalse(presenter.presentLoadMoreBeersCalled, "expected to never call presenter.presentLoadMoreBeers", file: file, line: line)
        }

        // it called presenter.presentLoadMoreBeers given number of times
        let actualNumberOfCalls = presenter.presentLoadMoreBeersCallsCount
        XCTAssertEqual(actualNumberOfCalls, expectedNumberOfCalls, "expected to call presenter.presentLoadMoreBeers \(expectedNumberOfCalls) times, but got \(actualNumberOfCalls) calls", file: file, line: line)

        return presenter.presentLoadMoreBeersReceivedResponse
    }

    private func checkWorkerFetchBeersCalls(expectedNumberOfCalls: Int,
                                            file: StaticString,
                                            line: UInt) -> WorkerExpectedIncomingParameterType? {
        if expectedNumberOfCalls > 0 {
            // it called worker.fetchBeers
            XCTAssertTrue(worker.fetchBeersPageSizePageNumberThenCalled, "expected to call worker.fetchBeers", file: file, line: line)
        } else {
            // it never called worker.fetchBeers
            XCTAssertFalse(worker.fetchBeersPageSizePageNumberThenCalled, "expected to never call worker.fetchBeers", file: file, line: line)
        }

        // it called worker.fetchBeers given number of times
        let actualNumberOfCalls = worker.fetchBeersPageSizePageNumberThenCallsCount
        XCTAssertEqual(actualNumberOfCalls, expectedNumberOfCalls, "expected to call worker.fetchBeers \(expectedNumberOfCalls) times, but got \(actualNumberOfCalls) calls", file: file, line: line)

        return (worker.fetchBeersPageSizePageNumberThenReceivedArguments!.pageSize, worker.fetchBeersPageSizePageNumberThenReceivedArguments!.pageNumber)
    }

    // MARK: - Run test

    private func runTestRequestLoadMoreBeers(given: RequestLoadMoreBeers.Given,
                                             expected: RequestLoadMoreBeers.Expected,
                                             presenterMock: BeerListMocks.Presenter? = .none,
                                             workerMock: BeerListMocks.Worker? = .none,
                                             expectation: XCTestExpectation? = .none,
                                             description: String = #function,
                                             file: StaticString = #file,
                                             line: UInt = #line) {
        // GIVEN
        let given = given

        // WHEN
        invokeRequestLoadMoreBeers(with: given,
                                   presenterMock: presenterMock,
                                   workerMock: workerMock,
                                   expectedNumberOfWorkerCalls: expected.expectedNumberOfWorkerCalls,
                                   expectation: expectation,
                                   description: description,
                                   file: file,
                                   line: line)

        // THEN
        //     Check Response
        let actualPresenterResponse: BeerList.LoadMoreBeers.Response? = checkPresenterPresentLoadMoreBeersCalls(expectedNumberOfCalls: expected.expectedNumberOfCalls, file: file, line: line)
        XCTAssertTrue(actualPresenterResponse == expected.response, "expected passed response to be \(String(describing: expected.response)), but got \(String(describing: actualPresenterResponse))", file: file, line: line)

        //     Check worker parameter
        let actualWorkerParameter: WorkerExpectedIncomingParameterType? = checkWorkerFetchBeersCalls(expectedNumberOfCalls: expected.expectedNumberOfWorkerCalls, file: file, line: line)
        XCTAssertTrue(actualWorkerParameter! == expected.workerParameter!, "expected passed worker parameter to be \(String(describing: expected.workerParameter)), but got \(String(describing: actualWorkerParameter))", file: file, line: line)

        //     Check output
        let actualOutput: BeerList.OutResult? = sut.outResult
        XCTAssertTrue(actualOutput == expected.output, "expected outResult to be \(String(describing: expected.output)), but got \(String(describing: actualOutput))", file: file, line: line)
    }
}

// MARK: - Tests

extension BeerListInteractorLoadMoreBeersTests {
    func testRequestLoadMoreBeers_Success() {
        // GIVEN
        let pageSize = 20
        let pageToLoad = 1
        //     Request
        let givenRequest: BeerList.LoadMoreBeers.Request = ()
        //     Worker result stub
        let beers = [Beer.mockA, Beer.mock]
        let givenWorkerParameter: WorkerGivenResultStubParameterType = .success(beers)
        let given = RequestLoadMoreBeers.Given(request: givenRequest, workerParameter: givenWorkerParameter)

        // EXPECTED
        //     Response
        let expectedPresenterPresentResponse: BeerList.LoadMoreBeers.Response = .success(beers)
        //     Worker paramter
        let expectedWorkerParameter: WorkerExpectedIncomingParameterType? = (pageSize, pageToLoad)
        let expected: RequestLoadMoreBeers.Expected = RequestLoadMoreBeers.Expected(response: expectedPresenterPresentResponse,
                                                                                    workerParameter: expectedWorkerParameter,
                                                                                    output: .none)

        // TEST
        runTestRequestLoadMoreBeers(given: given, expected: expected)
    }

    func testRequestLoadMoreBeers_Failure() {
        // GIVEN
        let pageSize = 20
        let pageToLoad = 1
        //     Request
        let givenRequest: BeerList.LoadMoreBeers.Request = ()
        //     Worker result stub
        let error = AppError.api(.explicitlyCancelled)
        let givenWorkerParameter: WorkerGivenResultStubParameterType = .failure(error)
        let given = RequestLoadMoreBeers.Given(request: givenRequest, workerParameter: givenWorkerParameter)

        // EXPECTED
        //     Response
        let expectedPresenterPresentResponse: BeerList.LoadMoreBeers.Response = .failure(error)
        //     Worker paramter
        let expectedWorkerParameter: WorkerExpectedIncomingParameterType? = (pageSize, pageToLoad)
        let expected: RequestLoadMoreBeers.Expected = RequestLoadMoreBeers.Expected(response: expectedPresenterPresentResponse,
                                                                                    workerParameter: expectedWorkerParameter,
                                                                                    output: .none)

        // TEST
        runTestRequestLoadMoreBeers(given: given, expected: expected)
    }
}
