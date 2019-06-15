//
//  SourceFactory.swift
//  ProxymanHub
//
//  Created by Nghia Tran on 6/15/19.
//  Copyright © 2019 Nghia Tran. All rights reserved.
//

import Foundation
import Alamofire

enum ContentType {
    case applicationJson
    case formURLEncoded

    var toStr: String {
        switch self {
        case .applicationJson:
            return "JSON"
        case .formURLEncoded:
            return "URLEncoded"
        }
    }
}

protocol SourceType {

    var contentType: ContentType { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
    var headers: HTTPHeaders { get }
}

extension SourceType {

    var baseURL: String {
        return "https://httpbin.org"
    }

    var url: String {
        return "\(baseURL)/\(method.rawValue)"
    }

    var shortDescription: String {
        return "\(contentType.toStr): \(method.rawValue.uppercased())"
    }

    func request() -> Request {
        return AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
    }
}

final class SourceFactory {

    let sources: [SourceType] = [JSONGet(), JSONPost(), URLEncodedGet(), URLEncodedPost()]
}
