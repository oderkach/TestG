//
//  AppError.swift
//  TestG
//
//  Created by Ostap Derkach on 21.01.2020.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import Alamofire

enum AppError: Error, Equatable {
    case api(Alamofire.AFError)
}

extension Alamofire.AFError: Equatable {
    public static func == (lhs: AFError, rhs: AFError) -> Bool {
        return lhs.responseCode == rhs.responseCode &&
            lhs.errorDescription == rhs.errorDescription &&
            lhs.localizedDescription == rhs.localizedDescription
    }
}
