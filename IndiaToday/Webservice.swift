//
//  Webservice.swift
//  IndiaToday
//
//  Created by Nithya Nehru on 6/3/22.
//  Copyright © 2022 apple. All rights reserved.
//

import Foundation

protocol WebserviceProtocol {
    func sendRequest<T: Codable>(
        endpoint: Endpoint,
        responseModel: T.Type
    ) async -> Result<T, ErrorHandler>
}

class Webservice : WebserviceProtocol {

    func sendRequest<T: Codable>(
        endpoint: Endpoint,
        responseModel: T.Type
    ) async -> Result<T, ErrorHandler> {
        guard let url = URL(string: endpoint.baseURL + endpoint.path) else {
            return .failure(.invalidURL)
        }
        if !ConnectionManager.shared.hasConnectivity() {
            return .failure(.connectionError)
        }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        do {
            let session = URLSession(configuration: URLSessionConfiguration.default)
            let (data, response) = try await session.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel.self, from: data) else {
                    return .failure(.decode)
                }
                return .success(decodedResponse)
            default:
                return .failure(.unexpectedStatusCode)
            }
        } catch {
            return .failure(.unknown)
        }
    }
    
}






