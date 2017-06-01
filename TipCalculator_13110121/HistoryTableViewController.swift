//
//  HistoryTableViewController.swift
//  TipCalculator_13110121
//
//  Created by Pham Huu Nhu on 6/2/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import UIKit
import CoreData

class HistoryTableViewController: UITableViewController {

    var history = [NSManagedObject]();
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        //select coredata
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "TipHistory")
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            for result in results{
                history.append(result as! NSManagedObject)
            }
        } catch {
            print("Error")
        }
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
        return history.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableViewCell
        let htr = history[indexPath.row]
        
        let moneyHistory = htr.value(forKey: "money") as? String
        let tipAmountHistory = htr.value(forKey: "tipAmount") as? String
        let resultHistory = htr.value(forKey: "result") as? String
        cell.txtMoneyHistory.text = moneyHistory
        cell.txtTipAmountHistory.text = tipAmountHistory
        cell.txtResultHistory.text = resultHistory
        
        
        return cell
    }

}
