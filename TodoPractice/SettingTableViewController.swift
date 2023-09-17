//
//  SettingTableViewController.swift
//  TodoPractice
//
//  Created by j_kim on 2023/09/17.
//

import UIKit

class SettingTableViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var SettingTableView: UITableView!
    
    let settings = ["계정", "일반"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SettingTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath)
        cell.textLabel?.text = settings[indexPath.row]

        return cell
    }
}
