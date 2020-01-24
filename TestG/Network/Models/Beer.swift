//
//  Beer.swift
//  TestG
//
//  Created by Ostap Derkach on 22.01.2020.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

struct Beer: Codable, Equatable {
    let id: Int
    let name: String
    let tagline: String
    let description: String
    let beerImageUrl: String

    // MARK: Decodable

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case description
        case beerImageUrl = "image_url"
    }
}
