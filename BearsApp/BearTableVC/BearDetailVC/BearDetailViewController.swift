//
//  BearDetailViewController.swift
//  BearsApp
//
//  Created by Виталий Субботин on 09/06/2019.
//  Copyright © 2019 Виталий Субботин. All rights reserved.
//

import UIKit

class BearDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var bear: Bear?
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(bear ?? 0)
        
        imageView.image = UIImage.init(named: bear?.image ?? "" )
        
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.rowHeight = 100
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BearDetailTableViewCell
        
        if let bear = bear {
            switch indexPath.row {
            case 0:
                cell.configureCell(forKey: "Производитель:", withValue: bear.manufacturer)
            case 1:
                cell.configureCell(forKey: "Цена(долл.):", withValue: String(describing: bear.cost) )
            case 2:
                cell.configureCell(forKey: "Высота(см.):", withValue: String(describing: bear.height) )
            case 3:
                cell.configureCell(forKey: "Качество:", withValue: String(describing: bear.quality) )
            default:
                break
            }
        }
        
        
        return cell
    }

}
