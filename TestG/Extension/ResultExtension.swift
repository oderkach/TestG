//
//  ResultExtension.swift
//  TestG
//
//  Created by Ostap Derkach on 21.01.2020.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

extension Result where Success == Void {
    public static var success: Result {
        return .success(())
    }
}

extension Result where Success == Void, Failure: Equatable {
    public static func == (lhs: Result<Success, Failure>, rhs: Result<Success, Failure>) -> Bool {
        return lhs.map { true } == rhs.map { true }
    }
}

extension Result {
    public func map() -> Result<Void, Failure> {
        return map { _ in () }
    }
}

public protocol ResultProtocol {
    associatedtype Failure: Error
    associatedtype Success

    var result: Result<Success, Failure> { get }
}

extension Result: ResultProtocol {
    public var result: Result<Success, Failure> {
        return self
    }
}
