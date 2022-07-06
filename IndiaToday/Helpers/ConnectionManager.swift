//
//  ConnectionManager.swift
//  IndiaToday
//
//  Created by Nithya Nehru on 06/07/22.
//

import Foundation
import Reachability

class ConnectionManager {

    static let shared = ConnectionManager()
    private init () {}

    func hasConnectivity() -> Bool {
        do {
            let reachability: Reachability = try Reachability()
            var isNetworkReachable = false
            if reachability.connection == .wifi || reachability.connection == .cellular {
                isNetworkReachable = true
            }
            return isNetworkReachable
        } catch {
            return false
        }
    }
}
