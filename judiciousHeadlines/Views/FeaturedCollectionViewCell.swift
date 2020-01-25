//
//  FeaturedCollectionViewCell.swift
//  judiciousHeadlines
//
//  Created by Wesley Espinoza on 1/24/20.
//  Copyright © 2020 Erick Espinoza. All rights reserved.
//

import Foundation
import UIKit

class FeaturedCollectionViewCell: UICollectionViewCell{
    static let identifier = "FeaturedCollectionViewCell"
    var headlines: [String] = []
    var headlinesCollectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(hex: 0xF3865D)
        setupHeader()
    }
    
    
    func setupHeader() {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.font = UIFont(name: "Optima-ExtraBlack", size: 35)
        header.text = "Trending."
        self.addSubview(header)
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            header.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8)
            
        ])
        
    }
    func setupCollectionView(){
        let flowlayout = UICollectionViewFlowLayout()
        headlinesCollectionView = UICollectionView(frame: self.frame, collectionViewLayout: flowlayout)
        headlinesCollectionView.backgroundColor = UIColor(hex: 0xEFEFEF)
        headlinesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        headlinesCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        headlinesCollectionView.delegate = self
        headlinesCollectionView.dataSource = self
        self.addSubview(headlinesCollectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension FeaturedCollectionViewCell: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let selectedCell = collectionView.cellForItem(at: indexPath) as! CategoryCollectionViewCell
    
        
    }
}

extension FeaturedCollectionViewCell: UICollectionViewDataSource{
    // NOTE: number of cells to return
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return headlines.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = CategoryCollectionViewCell()
        // NOTE: switch statment to return different cells at different indexs
        
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
//        cell.title = categories[indexPath.row]
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
}

extension FeaturedCollectionViewCell: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 190, height: 190 )
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
}

