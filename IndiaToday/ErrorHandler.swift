//
//  ErrorHandler.swift
//  IndiaToday
//
//  Created by Nithya Nehru on 30/06/22.
//  Copyright © 2022 apple. All rights reserved.
//

import Foundation

enum ErrorHandler: Error {
    case connectionError
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unknown
    case unexpectedStatusCode
    case noInput
    var customMessage: String {
        switch self {
        case .connectionError:
            return "Internet connection is not available"
        case .unauthorized:
            return "Session expired"
        case .invalidURL:
            return "Invalid url is loaded"
        case .noResponse:
            return "No data is available.Please input your category from the list"
        case .noInput:
            return "No input is given"
        default:
            return "Invalid Data is given"
        }
    }
}
