//
//  RankingTableViewController.swift
//  BearsApp
//
//  Created by Виталий Субботин on 08/06/2019.
//  Copyright © 2019 Виталий Субботин. All rights reserved.
//

import UIKit

class RankingTableViewController: UITableViewController {
    
    var sender: UITableViewController?
    
    var properties: [Property]?
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        
        tableView.reloadData()
        if let nvc = navigationController {
            if let bearTVC = nvc.viewControllers[1] as? BearTableViewController {
                
                var propertiesToRank = [Property]()
                for property in properties! {
                    if property.isSelected == true {
                        propertiesToRank.append(property)
                    }
                }
                
                bearTVC.dataRanking = rank(withProperties: propertiesToRank) ?? Array(0..<properties!.count)
                
                bearTVC.tableView.reloadData()
            }
            nvc.popViewController(animated: true)
        }
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        if let nvc = navigationController {
            nvc.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView.init(frame: .zero)
        tableView.rowHeight = 100
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RankingTableViewCell

        cell.configureCell(withProperty: properties![indexPath.row])
        
        if cell.propertyIsSelected() == true {
            cell.accessoryType = .checkmark
            
        }
        else {
            cell.accessoryType = .none
        }
        properties![indexPath.row].criterion = cell.getPropertyCriterion()

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if properties != nil {
            properties![indexPath.row].isSelected = !properties![indexPath.row].isSelected
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }

}
