//
//  MyCitiesController.swift
//  WeatherApp
//
//  Created by Rayen on 8/7/20.
//  Copyright © 2020 Rayen. All rights reserved.
//

import UIKit

class MyCitiesController: UITableViewController {
    
    var cities = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCityCell", for: indexPath) as! MyCitiesCell
        let city = cities[indexPath.row]
        cell.myCityName.text = city
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            cities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    
    @IBAction func addCity(segue: UIStoryboardSegue) {
        
        if segue.identifier == "addCity" {
            
            guard let allCitiesController = segue.source as? AllCitiesController else { return }
            
            if let indexPath = allCitiesController.tableView.indexPathForSelectedRow {
                
                let city = allCitiesController.cities[indexPath.row]
                
                if !cities.contains(city) {
                    cities.append(city)
                }
                tableView.reloadData()
            }
        }
    }
}
