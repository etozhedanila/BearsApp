//
//  ViewController.swift
//  BearsApp
//
//  Created by Виталий Субботин on 07/06/2019.
//  Copyright © 2019 Виталий Субботин. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private let segueIdentifier = "bearsSegue"
    
    private var bearButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(bearButtonTapped), for: .touchUpInside)
        
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
       
        return button
    }()
    
   
    private var bearImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "bear1")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    @objc func bearButtonTapped() {
        
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bearButton)
        
        
        bearButton.addSubview(bearImageView)
        
        
        setConstraints()

    }


}

extension MainViewController {
    
    func setConstraints() {
        bearButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        bearButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        bearButton.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -40).isActive = true
        bearButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 160).isActive = true
        
        bearImageView.topAnchor.constraint(equalTo: bearButton.topAnchor).isActive = true
        bearImageView.bottomAnchor.constraint(equalTo: bearButton.bottomAnchor).isActive = true
        bearImageView.leadingAnchor.constraint(equalTo: bearButton.leadingAnchor).isActive = true
        bearImageView.trailingAnchor.constraint(equalTo: bearButton.trailingAnchor).isActive = true
        
    }
}

