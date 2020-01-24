//
//  APIClient.swift
//  TestG
//
//  Created by Ostap Derkach on 22.01.2020.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import Alamofire

// simple APIClient without adapters, retriers, custom delegates...

enum APIClient {
    @discardableResult
    private static func executeRequest<T: Decodable>(request: URLRequestConvertible,
                                                     queu: DispatchQueue = .main,
                                                     decoder: DataDecoder = JSONDecoder(),
                                                     completion: @escaping (AFDataResponse<T>) -> Void) -> DataRequest {
        return AF.request(request)
            .validate()
            .responseDecodable(of: T.self, queue: queu, decoder: decoder, completionHandler: completion)
    }
}

extension APIClient {
    enum Beers {
        static func getBeers(pageSize: Int, pageNumber: Int, completion: @escaping (AFDataResponse<[Beer]>) -> Void) {
            executeRequest(request: BeerRouter.getBeers(pageSize: pageSize, pageNumber: pageNumber), completion: completion)
        }
    }
}
