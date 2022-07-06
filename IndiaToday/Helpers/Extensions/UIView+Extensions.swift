//
//  UIView+Extensions.swift
//  IndiaToday
//
//  Created by Nithya Nehru on 6/3/22.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit

extension UIView {
    
    static func viewForSectionHeader(title: String) -> UIView {
        let screenRect = UIScreen.main.bounds
        let headerView = UIView(frame: CGRect(x: 15, y: 0, width: screenRect.width, height: 60))
        
        headerView.backgroundColor = .white
        
        let sectionHeaderLbl = UILabel(frame: headerView.frame)
        sectionHeaderLbl.text = title.uppercased()
        sectionHeaderLbl.textColor = .black
        sectionHeaderLbl.font = UIFont.fontForSectionHeaderTitle()
        
        headerView.addSubview(sectionHeaderLbl)
        
        return headerView
    }
   
}
