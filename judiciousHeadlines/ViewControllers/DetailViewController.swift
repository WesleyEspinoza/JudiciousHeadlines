//
//  DetailViewController.swift
//  judiciousHeadlines
//
//  Created by Wesley Espinoza on 1/25/20.
//  Copyright © 2020 Erick Espinoza. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    let authorLabel: UILabel = UILabel()
    var authorString: String! {
        didSet{
            authorLabel.text = self.authorString
        }
    }
    let sourceLabel: UILabel = UILabel()
    var sourceString: String! {
        didSet{
            sourceLabel.text = self.sourceString
        }
    }
    let titleLabel: UILabel = UILabel()
    var titleString: String! {
        didSet{
            titleLabel.text = self.titleString
        }
    }
    let descriptionLabel: UILabel = UILabel()
    var descriptionString: String! {
        didSet{
            descriptionLabel.text = self.descriptionString
        }
    }
    let contentLabel: UILabel = UILabel()
    var contentString: String! {
        didSet{
            contentLabel.text = self.contentString
        }
    }
    let pusblishedLabel: UILabel = UILabel()
    var pusblishedString: String! {
        didSet{
            pusblishedLabel.text = self.pusblishedString
        }
    }
    let contentImageView: UIImageView! = UIImageView(image: UIImage(named: "loadingIcon"))
    var contentImageURL: String! {
        didSet {
            contentImageView.downloaded(from: self.contentImageURL)
        }
    }
    var url: String!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(hex: 0xEFEFEF)
        
        setupViews()
    }
    
    
    func setupViews(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 3
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 3
        
        sourceLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        contentImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.lineBreakMode = .byWordWrapping
        contentLabel.numberOfLines = 100
        
        pusblishedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(authorLabel)
        self.view.addSubview(pusblishedLabel)
        self.view.addSubview(contentImageView)
        self.view.addSubview(sourceLabel)
        self.view.addSubview(contentLabel)
        
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            
            descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            authorLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 5),
            authorLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            authorLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            sourceLabel.topAnchor.constraint(equalTo: self.authorLabel.bottomAnchor, constant: 5),
            sourceLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            sourceLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            
            pusblishedLabel.topAnchor.constraint(equalTo: self.sourceLabel.bottomAnchor, constant: 5),
            pusblishedLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            pusblishedLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            
            
            contentImageView.topAnchor.constraint(equalTo: self.pusblishedLabel.bottomAnchor, constant: 5),
            contentImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            contentImageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            contentImageView.heightAnchor.constraint(equalToConstant: 200),
            
            
            contentLabel.topAnchor.constraint(equalTo: self.contentImageView.bottomAnchor, constant: 5),
            contentLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            contentLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
        ])
    }
    
    
}
