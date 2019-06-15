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

struct Source {

    let contentType: ContentType
    let method: HTTPMethod
    let shortDescription: String

    init(contentType: ContentType, method: HTTPMethod) {
        self.contentType = contentType
        self.method = method
        self.shortDescription = "\(contentType.toStr): \(method.rawValue.uppercased())"
    }
}

final class SourceFactory {

    let sources: [Source] = [Source(contentType: .applicationJson, method: .get),
                             Source(contentType: .formURLEncoded, method: .post)]
}
