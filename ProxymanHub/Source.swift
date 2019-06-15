//
//  Source.swift
//  ProxymanHub
//
//  Created by Nghia Tran on 6/15/19.
//  Copyright © 2019 Nghia Tran. All rights reserved.
//

import Foundation
import Alamofire

let defaultHeaders: HTTPHeaders = HTTPHeaders(["X-Requested-With":"XMLHttpRequest",
                                               "Accept-Encoding": "br, gzip, deflate",
                                               "Referer": "https://proxyman.io"])
let defaultParameters: Parameters =  ["args": [],
                                      "files": [],
                                      "form": [],
                                      "headers": [ "Accept": "*/*",
                                                   "Accept-Language": "en;q=1.0",
                                                   "Host": "httpbin.org",
                                                   "User-Agent": "iOS Example/1.0 (org.alamofire.iOS-Example; build:1; iOS 12.2.0) Alamofire/5.0.0"],
                                      "json": ["hot": 7.889,
                                               "name": "nghia",
                                               "price": 1.2,
                                               "tag": 70.922],
                                      "origin": "103.253.89.30, 103.253.89.30",
                                      "url": "https://httpbin.org/post",
]

// MARK: JSON

struct JSONGet: SourceType {

    let contentType: ContentType = .applicationJson
    let method: HTTPMethod = .get
    let encoding: ParameterEncoding = JSONEncoding.default
    let headers: HTTPHeaders = defaultHeaders
    let parameters: Parameters? = nil
}

struct JSONPost: SourceType {

    let contentType: ContentType = .applicationJson
    let method: HTTPMethod = .get
    let encoding: ParameterEncoding = JSONEncoding.default
    let headers: HTTPHeaders = defaultHeaders
    let parameters: Parameters? = defaultParameters
}

// MARK: URLEncoded

struct URLEncodedGet: SourceType {

    let contentType: ContentType = .formURLEncoded
    let method: HTTPMethod = .get
    let encoding: ParameterEncoding = URLEncoding.default
    let headers: HTTPHeaders = defaultHeaders
    let parameters: Parameters? = defaultParameters
}

struct URLEncodedPost: SourceType {

    let contentType: ContentType = .formURLEncoded
    let method: HTTPMethod = .post
    let encoding: ParameterEncoding = URLEncoding.default
    let headers: HTTPHeaders = defaultHeaders
    let parameters: Parameters? = defaultParameters
}

