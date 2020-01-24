//
//  XCTestExtension.swift
//  TestGTests
//
//  Created by Ostap Derkach on 23.01.2020.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {
    func nextExpectation(for expectation: XCTestExpectation) -> XCTestExpectation {
        let originalExpectationDescription = expectation.expectationDescription
        let expectationDescription: String
        let index: Int
        if let lowerBond = originalExpectationDescription.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted, options: .backwards)?.lowerBound,
            let int = Int(originalExpectationDescription.suffix(from: lowerBond)) {
            index = int
            expectationDescription = String(originalExpectationDescription.prefix(upTo: lowerBond))
        } else {
            index = 2
            expectationDescription = originalExpectationDescription + "_"
        }
        return self.expectation(description: expectationDescription + "\(index)")
    }
}
