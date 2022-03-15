//
//  ViewController.swift
//  Reminder
//
//  Created by 高橋蓮 on 2022/03/15.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    @IBOutlet var table: UITableView!
    var models = [MyReminder]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
    }
    @IBAction func didTapedAddButton() {
        
    }
    @IBAction func didTapedTestButton() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                self.scheduledTest()
            } else if let error = error {
                print("error")
            }
        }
    }
    func scheduledTest() {
        let content = UNMutableNotificationContent()
        content.title = "Hello"
        content.sound = .default
        content.body = "boby"
        let targedate = Date().addingTimeInterval(10)
        let triger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents(
            [.year, .month, .day, .hour, .minute, .second],
            from: targedate), repeats: false)
        let request = UNNotificationRequest(identifier: "id", content: content, trigger: triger)
        UNUserNotificationCenter.current().add(request) { error in
            if error != nil {
                print("error")
            }
        }
    }

}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        return cell
    }
    
    
}
struct MyReminder {
    let title: String
    let date: Date
    let identifier: String
}

