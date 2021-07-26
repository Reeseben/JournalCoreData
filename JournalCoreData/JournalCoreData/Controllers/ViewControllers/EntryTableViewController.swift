//
//  EntryTableViewController.swift
//  JournalCoreData
//
//  Created by Ben Erekson on 7/26/21.
//

import UIKit

class EntryTableViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        EntryController.shared.fetchEntries()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source}

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return EntryController.shared.entries.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)

        let currentEnty = EntryController.shared.entries[indexPath.row]
        
        cell.textLabel?.text = currentEnty.title
        cell.detailTextLabel?.text = currentEnty.timeStamp?.dateAsString()

        return cell
    }


    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }



    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let entry = EntryController.shared.entries[indexPath.row]
            EntryController.shared.entries.remove(at: indexPath.row)
            EntryController.shared.deleteEntry(entry: entry)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }




    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEntry"{
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destination = segue.destination as? EntryDetailsViewController else { return }
            let entry = EntryController.shared.entries[indexPath.row]
            destination.entry = entry
        }
    }


}
