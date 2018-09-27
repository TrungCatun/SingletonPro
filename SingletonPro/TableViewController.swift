//
//  TableViewController.swift
//  SingletonPro
//
//  Created by trung on 2018/08/21.
//  Copyright © 2018 trung. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(Singleton.shared.array)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Singleton.shared.array.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(Singleton.shared.array[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Singleton.shared.index = indexPath.row
        if let toDetail = storyboard?.instantiateViewController(withIdentifier: "id") as? DetailViewController {
            navigationController?.pushViewController(toDetail, animated: true)
        }
    }
    
    @IBAction func actionAddTableView(_ sender: Any) {
        Singleton.shared.index = Singleton.shared.array.count + 1
        if let toDetail = storyboard?.instantiateViewController(withIdentifier: "id") as? DetailViewController {
            navigationController?.pushViewController(toDetail, animated: true)
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Singleton.shared.remove(at: indexPath)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    



}
