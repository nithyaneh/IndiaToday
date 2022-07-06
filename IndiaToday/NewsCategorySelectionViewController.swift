//
//  NewsCategorySelectionViewController.swift
//  IndiaToday
//
//  Created by Nithya Nehru on 06/07/22.
//

import UIKit

class NewsCategorySelectionViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet weak private var categoryListView: UITextView!
    @IBOutlet weak private var categoryTextField: UITextField!
    
    lazy var categoryType: [String] = {
        [unowned self] in
        return Constants.categories
    }()
    
//MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryListView.attributedText = String.bulletPointList(strings: categoryType)
        categoryTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Button action
    
    @IBAction func SearchAct(_ sender: Any) {
        if !(categoryTextField.text == "") {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "NewsVC") as! NewsDisplayTableViewController
            nextViewController.categoryTitle = categoryTextField.text
            navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            AlertHandler.showAlert(forMessage: Constants.ShowAlert.selectCategory, title: Constants.ShowAlert.alertTitle, defaultButtonTitle: Constants.ShowAlert.okTitle, sourceViewController: self)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
//MARK: - Extension for delegate

extension NewsCategorySelectionViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
