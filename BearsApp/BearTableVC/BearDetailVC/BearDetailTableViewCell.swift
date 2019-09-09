//
//  BearDetailTableViewCell.swift
//  BearsApp
//
//  Created by Виталий Субботин on 09/06/2019.
//  Copyright © 2019 Виталий Субботин. All rights reserved.
//

import UIKit

class BearDetailTableViewCell: UITableViewCell {

    private var keyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setConstraints() {
        keyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        keyLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        valueLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        valueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
    }
    
    func configureCell(forKey key: String, withValue value: String) {
        self.addSubview(keyLabel)
        self.addSubview(valueLabel)
        
        keyLabel.text = key
        valueLabel.text = value
        
        setConstraints()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
