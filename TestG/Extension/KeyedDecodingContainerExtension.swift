//
//  KeyedDecodingContainerExtension.swift
//  TestG
//
//  Created by Ostap Derkach on 22.01.2020.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

extension KeyedDecodingContainer {

    func decode<T: Decodable>(key: K) throws -> T {
        return try decode(T.self, forKey: key)
    }

    func decodeIfPresent<T: Decodable>(key: K) throws -> T? {
        return try decodeIfPresent(T.self, forKey: key)
    }
}
