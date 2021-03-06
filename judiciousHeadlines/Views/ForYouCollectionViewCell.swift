//
//  ForYouCollectionViewCell.swift
//  judiciousHeadlines
//
//  Created by Wesley Espinoza on 1/24/20.
//  Copyright © 2020 Erick Espinoza. All rights reserved.
//

import Foundation
import UIKit

import Foundation
import UIKit

class ForYouCollectionViewCell: UICollectionViewCell{
    static let identifier = "ForYouCollectionViewCell"
    var delegate: UIViewController!
    var headlines: [Headline] = [] {
        didSet{
            self.headlinesCollectionView.reloadData()
        }
    }
    let header = UILabel()
    var headlinesCollectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.preservesSuperviewLayoutMargins = false
        self.layoutMargins = .zero
        self.backgroundColor = UIColor(hex: 0xEFEFEF)
        setupHeader()
        setupCollectionView()
    }
    
    
    func setupHeader() {
        header.translatesAutoresizingMaskIntoConstraints = false
        header.font = UIFont(name: "Optima-ExtraBlack", size: 35)
        header.text = "For You!"
        self.addSubview(header)
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            header.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            header.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8)
            
        ])
        
    }
    func setupCollectionView(){
        let api = NewsServiceAPI.shared
        api.getForYouHeadlines { (response) in
            self.headlines = response.articles
        }
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        headlinesCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowlayout)
        headlinesCollectionView.backgroundColor = UIColor.clear
        headlinesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        headlinesCollectionView.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: NewsCollectionViewCell.identifier)
        headlinesCollectionView.delegate = self
        headlinesCollectionView.dataSource = self
        self.addSubview(headlinesCollectionView)
        
        NSLayoutConstraint.activate([
            headlinesCollectionView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 8),
            headlinesCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            headlinesCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            headlinesCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension ForYouCollectionViewCell: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        let selectedCell = collectionView.cellForItem(at: indexPath) as! CategoryCollectionViewCell
        
        
    }
}

extension ForYouCollectionViewCell: UICollectionViewDataSource{
    // NOTE: number of cells to return
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return headlines.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = NewsCollectionViewCell()
        // NOTE: switch statment to return different cells at different indexs
        
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.identifier, for: indexPath) as! NewsCollectionViewCell
        //        cell.title = categories[indexPath.row]
        
        cell.source = headlines[indexPath.row].source?.name ?? "No Source"
        cell.title = headlines[indexPath.row].title ?? "No Tile"
        cell.imageURL = headlines[indexPath.row].urlToImage
        cell.layer.cornerRadius = 10
        return cell
    }
    
}

extension ForYouCollectionViewCell: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.bounds.width - 32 , height: self.bounds.height / 2 )
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 8, bottom: 16, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    
}

