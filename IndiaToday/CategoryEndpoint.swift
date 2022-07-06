//
//  CategoryEndpoint.swift
//  IndiaToday
//
//  Created by Nithya Nehru on 30/06/22.
//  Copyright © 2022 apple. All rights reserved.
//

import Foundation

enum CategoryEndpoint {
    case categoryCountry(category: String)
}

extension CategoryEndpoint: Endpoint {
    var path: String {
        switch self {
        case .categoryCountry(category: let category):
            return "category=\(category)&country=in&apiKey=\(Constants.apikey)"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .categoryCountry:
            return .get
        }
    }
    
}
