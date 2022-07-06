//
//  CustomNavigationBar.swift
//  IndiaToday
//
//  Created by Nithya Nehru on 06/07/22.
//

import Foundation
import UIKit

class CustomNavBar {
    
    static func setup() {
        
        UINavigationBar.appearance().topItem?.title = "News"
        UINavigationBar.appearance().barTintColor = UIColor(red: 59/255, green: 128/255, blue: 167/255, alpha: 1.00)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
      
            }
    
}
