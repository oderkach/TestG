//
//  BeerRouterTest.swift
//  TestGTests
//
//  Created by Ostap Derkach on 23.01.2020.
//  Copyright © 2020 Test. All rights reserved.
//

import XCTest
@testable import TestG

final class BeerRouterTests: XCTestCase {

    func testGetBeers() {
        let pageSize = 20
        let pageNumber = 0

        let expectedMethod = "GET"
        let expectedScheme = "https"
        let expectedHost = "api.punkapi.com"
        let expectedPath = "/v2/beers"
        let expectedQueryItems =  [URLQueryItem(name: "page", value: "\(pageNumber)"),
                                   URLQueryItem(name: "per_page", value: "\(pageSize)")]

        let request = try! BeerRouter.getBeers(pageSize: pageSize, pageNumber: pageNumber).asURLRequest()

        XCTAssertNotNil(request)
        XCTAssertEqual(request.httpMethod, expectedMethod)
        XCTAssertEqual(request.url!.scheme, expectedScheme)
        XCTAssertEqual(request.url!.host, expectedHost)
        XCTAssertEqual(request.url!.path, expectedPath)
        XCTAssertEqual(URLComponents(url: request.url!, resolvingAgainstBaseURL: false)!.queryItems, expectedQueryItems)
    }
}
