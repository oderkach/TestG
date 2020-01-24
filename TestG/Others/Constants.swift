//
//  Constants.swift
//  TestG
//
//  Created by Ostap Derkach on 21.01.2020.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

enum Constants {

    static let baseURLPath = "https://api.punkapi.com"

    enum HTTPHeaderField: String {
        case contentType = "Content-Type"
    }

    enum ContentType: String {
        case json = "application/json"
    }
}
