//
//  SettingTableViewController.swift
//  TipCalculator_13110121
//
//  Created by Pham Huu Nhu on 6/1/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    //list of tip amuont
    lazy var listTtip = ["5","10","15"]
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listTtip.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "setting", for: indexPath)
        
        let setting = listTtip[indexPath.row]
        
        cell.textLabel?.text = setting;
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "show") {
            
            let showVC = segue.destination as! MainViewController
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let setting = listTtip[indexPath.row]
                showVC.tip = setting
            }
        }
    }    
}
