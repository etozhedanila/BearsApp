//
//  BearTableViewController.swift
//  BearsApp
//
//  Created by Виталий Субботин on 07/06/2019.
//  Copyright © 2019 Виталий Субботин. All rights reserved.
//

import UIKit

class BearTableViewController: UITableViewController {

    private let detailSegueIdentifier = "bearDetailSegue"
    private let rankingSegueIdentifier = "rankingSegue"
    
    var data = bears
    
    lazy var dataRanking = Array(0..<data.count)
    var costProperty = Property(name: "Цена")
    var heightProperty = Property(name: "Высота")
    var qualityProperty = Property(name: "Качество")
    var properties = [Property]()
    
    @IBAction func rankButtonTapped(_ sender: UIBarButtonItem) {

    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        dataRanking = Array(0..<data.count)
        
        tableView.reloadData()
    }
    
    func fillProperties() {
        for bear in data {
            costProperty.values.append(bear.cost)
            heightProperty.values.append(bear.height)
            qualityProperty.values.append(bear.quality)
        }
    }
    
    func clearProperties() {
        costProperty.values.removeAll()
        heightProperty.values.removeAll()
        qualityProperty.values.removeAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView.init(frame: .zero)
        tableView.rowHeight = 140
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return bears.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BearTableViewCell

        cell.configureCell(withData: data[dataRanking[indexPath.row]])

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == rankingSegueIdentifier {
            let dvc = segue.destination as! RankingTableViewController
            clearProperties()
            fillProperties()
            dvc.properties = [costProperty, heightProperty, qualityProperty]
            dvc.sender = self
            
        }
        if segue.identifier == detailSegueIdentifier {
            if let indexPath = tableView.indexPathForSelectedRow {
                let dvc = segue.destination as! BearDetailViewController
                dvc.bear = data[dataRanking[indexPath.row]]
            }
        }
    }
    
}
