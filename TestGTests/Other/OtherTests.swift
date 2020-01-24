//
//  OtherTests.swift
//  TestGTests
//
//  Created by Ostap Derkach on 23.01.2020.
//  Copyright © 2020 Test. All rights reserved.
//

import XCTest
@testable import TestG

final class OtherTests: XCTestCase {

    func testBaseURLPath() {
        let expectedBaseURLPath = "https://api.punkapi.com"
        let expectedURL = URL(string: expectedBaseURLPath)!

        let baseURLPath = Constants.baseURLPath
        let url = URL(string: baseURLPath)!

        XCTAssertEqual(baseURLPath, expectedBaseURLPath)
        XCTAssertEqual(url, expectedURL)
    }
}
