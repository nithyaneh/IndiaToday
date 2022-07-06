//
//  Constants.swift
//  IndiaToday
//
//  Created by Nithya Nehru on 06/07/22.
//

import Foundation
import UIKit

struct Constants {
    
    static let apikey = "5a644882473348638e28bddf8bf19666"
    static let country = "in"
    static let searchTitle = "Search"
    static let categories: [String] = ["Business","Sports","Entertainment","General","Health"]
    
    struct Network {
        static let errorMessage = "Please check your internet connection and try again"
        static let errorTitle = "No internet connection"
        static let errorText = "Error"
    }
    struct ShowAlert {
        static let selectCategory = "Please type your category and search"
        static let okTitle = "OK"
        static let alertTitle = "Alert!"
    }
    static func isCydiaAppInstalled() -> Bool {
        return UIApplication.shared.canOpenURL(URL(string: "cydia://")!)
    }
    static func canEditSandboxFilesForJailBreakDetecttion() -> Bool {
        let jailBreakTestText = "Test for JailBreak"
        do {
            try jailBreakTestText.write(toFile:"/private/jailBreakTestText.txt", atomically:true, encoding:String.Encoding.utf8)
            return true
        } catch {
            return false
        }
    }
}


