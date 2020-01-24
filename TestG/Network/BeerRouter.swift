//
//  BeerRouter.swift
//  TestG
//
//  Created by Ostap Derkach on 22.01.2020.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import Alamofire

enum BeerRouter: URLRequestConvertible {

    case getBeers(pageSize: Int, pageNumber: Int)

    // MARK: - HTTPMethod

    private var method: HTTPMethod {
        switch self {
        case .getBeers:
            return .get
        }
    }

    // MARK: - Path

    private var path: String {
        switch self {
        case .getBeers:
            return "v2/beers"
        }
    }

    // MARK: - Parameters

    private var parameters: Parameters? {
        switch self {
        case let .getBeers(pageSize, pageNumber):
            return ["page": pageNumber, "per_page": pageSize]
        }
    }

    // MARK: - URLRequestConvertible

    func asURLRequest() throws -> URLRequest {
        let baseUrl = try Constants.baseURLPath.asURL()

        var urlRequest = URLRequest(url: baseUrl.appendingPathComponent(path, isDirectory: false))
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(Constants.ContentType.json.rawValue,
                            forHTTPHeaderField: Constants.HTTPHeaderField.contentType.rawValue)

        return try URLEncoding.default.encode(urlRequest, with: parameters)
    }
}
