//
//  AddViewController.swift
//  Reminder
//
//  Created by 高橋蓮 on 2022/03/15.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var titleField: UITextField!
    @IBOutlet var bobyField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    public var completion: ((String, String, Date) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.delegate = self
        bobyField.delegate = self

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapedSaveButton))
        bobyField.attributedPlaceholder = NSAttributedString(string: "Boby",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        titleField.attributedPlaceholder = NSAttributedString(string: "Title",
                                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
       
    }
    @objc func didTapedSaveButton() {
        if let titleText = titleField.text, !titleText.isEmpty,
           let bobyText = bobyField.text, !bobyText.isEmpty {
            let targetDate = datePicker.date
            completion?(titleText, bobyText, targetDate)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
