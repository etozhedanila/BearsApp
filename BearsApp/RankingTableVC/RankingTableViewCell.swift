//
//  RankingTableViewCell.swift
//  BearsApp
//
//  Created by Виталий Субботин on 08/06/2019.
//  Copyright © 2019 Виталий Субботин. All rights reserved.
//

import UIKit

class RankingTableViewCell: UITableViewCell {
    
    
    private var property: Property?
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    private var segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl()
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.insertSegment(withTitle: "min", at: 0, animated: true)
        sc.insertSegment(withTitle: "max", at: 1, animated: true)
        sc.selectedSegmentIndex = 0
        
        return sc
    }()
    
    
    func getPropertyCriterion() -> Criterion {
        return segmentedControl.selectedSegmentIndex == 0 ? .min : .max
    }
    

    
    func configureCell(withProperty property: Property) {
        self.property = property
        
        self.addSubview(nameLabel)
        self.addSubview(segmentedControl)
        
        setConstraints()
    }
    
    func selected() {
        if property != nil {
            property!.isSelected = !property!.isSelected
        }
    }
    
    func propertyIsSelected() -> Bool {
        guard let property = property else {
            return false
        }
        return property.isSelected
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension RankingTableViewCell {
    
    func setConstraints() {
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        
        if let property = property {
            nameLabel.text = property.name
        }
        
        segmentedControl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        segmentedControl.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
