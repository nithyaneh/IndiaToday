//
//  Endpoint.swift
//  IndiaToday
//
//  Created by Nithya Nehru on 30/06/22.
//  Copyright © 2022 apple. All rights reserved.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: RequestMethod { get }
}

extension Endpoint {
    var baseURL: String {
        return "https://newsapi.org/v2/top-headlines?"
    }
}

enum RequestMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
}
