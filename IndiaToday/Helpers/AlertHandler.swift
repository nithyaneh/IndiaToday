//
//  AlertHandler.swift
//  IndiaToday
//
//  Created by Nithya Nehru on 06/07/22.
//

import Foundation
import UIKit

struct AlertHandler {

    static func showAlert(forMessage: String, title: String, defaultButtonTitle: String, sourceViewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: forMessage, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: defaultButtonTitle, style: .default)
        alertController.addAction(defaultAction)
        sourceViewController.present(alertController, animated: true, completion: nil)
    }
}
