//
//  BearTableViewCell.swift
//  BearsApp
//
//  Created by Виталий Субботин on 07/06/2019.
//  Copyright © 2019 Виталий Субботин. All rights reserved.
//

import UIKit

class BearTableViewCell: UITableViewCell {

    private var bear: Bear?
    
    private var bearImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var costLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    private var heightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    private var qualityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    func setData() {
        guard let bear = bear else {
            return
        }
        heightLabel.text = "Высота: \(bear.height)"
        costLabel.text = "Цена: \(bear.cost) $"
        bearImageView.image = UIImage(named: bear.image)
        qualityLabel.text = "Качество: \(bear.quality)"
    }
    
    func configureCell(withData data: Bear) {
        
        bear = data
        
        setData()
        
        self.addSubview(bearImageView)
        self.addSubview(costLabel)
        self.addSubview(qualityLabel)
        self.addSubview(heightLabel)
        
        setConstraints()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension BearTableViewCell {
    
    func setConstraints() {
        bearImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        bearImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        bearImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        bearImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        costLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        costLabel.leadingAnchor.constraint(equalTo: bearImageView.trailingAnchor, constant: 20).isActive = true
        
        heightLabel.topAnchor.constraint(equalTo: costLabel.bottomAnchor, constant: 20).isActive = true
        heightLabel.leadingAnchor.constraint(equalTo: bearImageView.trailingAnchor, constant: 20).isActive = true
        
        qualityLabel.leadingAnchor.constraint(equalTo: bearImageView.trailingAnchor, constant: 20).isActive = true
        qualityLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 20).isActive = true
    }
}
