//
//  Constants.swift
//  IndiaToday
//
//  Created by Nithya Nehru on 06/07/22.
//

import Foundation
import UIKit

struct Constants {
    
    static let apikey = "421419166c2b44948928a01863246623"
    static let defaultURL = "https://edition.cnn.com"
    static let country = "in"
    static let searchTitle = "Search"
    static let categories: [String] = ["Business","Sports","Entertainment","General","Health"]
    
    struct Network {
        static let errorMessage = "Please check your internet connection and try again"
        static let errorTitle = "No internet connection"
        static let errorText = "Error"
    }
    struct Category {
        static let Business = "Business"
        static let Sports = "Sports"
        static let Entertainment = "Entertainment"
        static let General = "General"
        static let Health = "Health"
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


