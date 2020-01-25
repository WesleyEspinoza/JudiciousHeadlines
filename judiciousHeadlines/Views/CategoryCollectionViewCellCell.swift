//
//  CategoryCell.swift
//  judiciousHeadlines
//
//  Created by Wesley Espinoza on 1/24/20.
//  Copyright © 2020 Erick Espinoza. All rights reserved.
//

import Foundation
import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"
    let header = UILabel()
    let checkIcon = UIImage(named: "checkIcon")
    var checkView: UIImageView!
    var wasSelected: Bool = false {
        didSet{
            if self.wasSelected{
                setupCheck()
                return
            }
            removeCheck()
        }
    }
    var title: String = "Title" {
        didSet{
            self.header.text = self.title
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .random(alpha: 1)
        checkView = UIImageView(image: checkIcon)
        checkView.alpha = 0
        setupTitle()
    }
    
    func setupTitle() {
        header.lineBreakMode = .byWordWrapping
        header.numberOfLines = 3
        header.textAlignment = .center
        header.translatesAutoresizingMaskIntoConstraints = false
        header.font = UIFont(name: "Optima-ExtraBlack", size: 25)
        self.addSubview(header)
        
        NSLayoutConstraint.activate([
            header.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            header.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: 0),
            header.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            header.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8)
            
        ])
        
        checkView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(checkView)
        NSLayoutConstraint.activate([
            checkView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            checkView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
    }
    
    
     func setupCheck(){
        
        self.alpha = 0.7
        checkView.alpha = 0.6
    }
    
    func removeCheck(){
        checkView.alpha = 0
        self.alpha = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
