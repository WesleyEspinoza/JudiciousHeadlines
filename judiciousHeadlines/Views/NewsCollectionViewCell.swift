//
//  NewsCollectionViewCell.swift
//  judiciousHeadlines
//
//  Created by Wesley Espinoza on 1/25/20.
//  Copyright © 2020 Erick Espinoza. All rights reserved.
//

import Foundation
import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NewsCollectionViewCell"
    let sourceLabel = UILabel()
    var imageURL: String! {
        didSet{
            contentImageView.downloaded(from: self.imageURL)
        }
    }
    var contentImageView: UIImageView!
    var source: String = "Haze" {
        didSet{
            self.sourceLabel.text = self.source
        }
    }
    let titleLabel = UILabel()
    var title: String = "best player" {
        didSet{
            self.titleLabel.text = self.title
        }
    }
    
    let contentLabel = UILabel()
    var content: String = "one of the best players in seige" {
        didSet{
            self.contentLabel.text = self.content
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .random(alpha: 1)
        setupViews()
    }
    
    func setupViews() {
        contentImageView = UIImageView(image: UIImage(named: "loadingIcon"))
        contentImageView.translatesAutoresizingMaskIntoConstraints = false
        contentImageView.clipsToBounds = true
        contentImageView.sizeToFit()
        self.addSubview(contentImageView)
        
        NSLayoutConstraint.activate([
            contentImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            contentImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            contentImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            contentImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
        sourceLabel.lineBreakMode = .byWordWrapping
        sourceLabel.numberOfLines = 3
        sourceLabel.textAlignment = .left
        sourceLabel.translatesAutoresizingMaskIntoConstraints = false
        sourceLabel.font = UIFont(name: "Optima-ExtraBlack", size: 20)
        contentImageView.addSubview(sourceLabel)
        
        NSLayoutConstraint.activate([
            sourceLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 2),
            sourceLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            sourceLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8)
            
        ])
        
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 3
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont(name: "Optima-ExtraBlack", size: 15)
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.contentImageView.bottomAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: self.contentImageView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: self.contentImageView.trailingAnchor, constant: -8)
            
        ])
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

