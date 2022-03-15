//
//  AddViewController.swift
//  Reminder
//
//  Created by 高橋蓮 on 2022/03/15.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet var titleField: UITextField!
    @IBOutlet var bobyField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    public var completion: ((String, String, Date) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    @IBAction func didTapedSaveButton() {
        if let titleText = titleField.text, !titleText.isEmpty,
           let bobyText = bobyField.text, !bobyText.isEmpty {
            let targetDate = datePicker.date
        }
    }
    
}
