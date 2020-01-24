//
//  BeerMock.swift
//  TestGTests
//
//  Created by Ostap Derkach on 23.01.2020.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
@testable import TestG

extension Beer {
    static var mock: Beer {
        return Beer(id: 1, name: "name", tagline: "tagline", description: "description", beerImageUrl: "https://images.punkapi.com/v2/192.png")
    }

    static var mockA: Beer {
        return Beer(id: 2, name: "nameA", tagline: "taglineA", description: "descriptionA", beerImageUrl: "https://images.punkapi.com/v2/193.png")
    }
}
