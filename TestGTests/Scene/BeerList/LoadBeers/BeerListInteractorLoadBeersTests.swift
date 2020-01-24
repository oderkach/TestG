// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery

@testable import TestG
import Foundation
import XCTest

final class BeerListInteractorLoadBeersTests: BeerListInteractorTests {
    private typealias WorkerGivenResultStubParameterType = Result<[Beer], AppError>
    private typealias WorkerExpectedIncomingParameterType = (Int, Int)

    private enum RequestLoadBeers {
        struct Given {
            let request: BeerList.LoadBeers.Request
            let workerParameter: WorkerGivenResultStubParameterType

            init(request: BeerList.LoadBeers.Request,
                 workerParameter: WorkerGivenResultStubParameterType) {
                self.request = request
                self.workerParameter = workerParameter
            }
        }

        struct Expected {
            let response: BeerList.LoadBeers.Response?
            let expectedNumberOfCalls: Int
            let workerParameter: WorkerExpectedIncomingParameterType?
            let expectedNumberOfWorkerCalls: Int
            let output: BeerList.OutResult?

            init(response: BeerList.LoadBeers.Response?,
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
    }

    // MARK: - Invocation

    private func invokeRequestLoadBeers(with given: RequestLoadBeers.Given,
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
        sut.requestLoadBeers(given.request)

        // THEN
        waitForExpectations(timeout: 1) { (error) in
            XCTAssertNil(error, "Expectations are not fulfilled", file: file, line: line)
        }
    }

    // MARK: - Check method calls

    private func checkPresenterPresentLoadBeersCalls(expectedNumberOfCalls: Int,
                                                     file: StaticString,
                                                     line: UInt) -> BeerList.LoadBeers.Response? {
        if expectedNumberOfCalls > 0 {
            // it called presenter.presentLoadBeers
            XCTAssertTrue(presenter.presentLoadBeersCalled, "expected to call presenter.presentLoadBeers", file: file, line: line)
        } else {
            // it never called presenter.presentLoadBeers
            XCTAssertFalse(presenter.presentLoadBeersCalled, "expected to never call presenter.presentLoadBeers", file: file, line: line)
        }

        // it called presenter.presentLoadBeers given number of times
        let actualNumberOfCalls = presenter.presentLoadBeersCallsCount
        XCTAssertEqual(actualNumberOfCalls, expectedNumberOfCalls, "expected to call presenter.presentLoadBeers \(expectedNumberOfCalls) times, but got \(actualNumberOfCalls) calls", file: file, line: line)

        return presenter.presentLoadBeersReceivedResponse
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

    private func runTestRequestLoadBeers(given: RequestLoadBeers.Given,
                                         expected: RequestLoadBeers.Expected,
                                         presenterMock: BeerListMocks.Presenter? = .none,
                                         workerMock: BeerListMocks.Worker? = .none,
                                         expectation: XCTestExpectation? = .none,
                                         description: String = #function,
                                         file: StaticString = #file,
                                         line: UInt = #line) {
        // GIVEN
        let given = given

        // WHEN
        invokeRequestLoadBeers(with: given,
                               presenterMock: presenterMock,
                               workerMock: workerMock,
                               expectedNumberOfWorkerCalls: expected.expectedNumberOfWorkerCalls,
                               expectation: expectation,
                               description: description,
                               file: file,
                               line: line)

        // THEN
        //     Check Response
        let actualPresenterResponse: BeerList.LoadBeers.Response? = checkPresenterPresentLoadBeersCalls(expectedNumberOfCalls: expected.expectedNumberOfCalls, file: file, line: line)
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

extension BeerListInteractorLoadBeersTests {
    func testRequestLoadBeers_Success() {
        // GIVEN
        let pageSize = 20
        let pageToLoad = 1
        //     Request
        let givenRequest: BeerList.LoadBeers.Request = ()
        //     Worker result stub
        let beers = [Beer.mockA, Beer.mock]
        let givenWorkerParameter: WorkerGivenResultStubParameterType = .success(beers)
        let given = RequestLoadBeers.Given(request: givenRequest, workerParameter: givenWorkerParameter)

        // EXPECTED
        //     Response
        let expectedPresenterPresentResponse: BeerList.LoadBeers.Response = .success(beers)
        //     Worker paramter
        let expectedWorkerParameter: WorkerExpectedIncomingParameterType? = (pageSize, pageToLoad)
        let expected: RequestLoadBeers.Expected = RequestLoadBeers.Expected(response: expectedPresenterPresentResponse,
                                                                            workerParameter: expectedWorkerParameter,
                                                                            output: .none)

        // TEST
        runTestRequestLoadBeers(given: given, expected: expected)
    }

    func testRequestLoadBeers_Failure() {
        // GIVEN
        let pageSize = 20
        let pageToLoad = 1
        //     Request
        let givenRequest: BeerList.LoadBeers.Request = ()
        //     Worker result stub
        let error = AppError.api(.explicitlyCancelled)
        let givenWorkerParameter: WorkerGivenResultStubParameterType = .failure(error)
        let given = RequestLoadBeers.Given(request: givenRequest, workerParameter: givenWorkerParameter)

        // EXPECTED
        //     Response
        let expectedPresenterPresentResponse: BeerList.LoadBeers.Response = .failure(error)
        //     Worker paramter
        let expectedWorkerParameter: WorkerExpectedIncomingParameterType? = (pageSize, pageToLoad)
        let expected: RequestLoadBeers.Expected = RequestLoadBeers.Expected(response: expectedPresenterPresentResponse,
                                                                            workerParameter: expectedWorkerParameter,
                                                                            output: .none)

        // TEST
        runTestRequestLoadBeers(given: given, expected: expected)
    }
}
