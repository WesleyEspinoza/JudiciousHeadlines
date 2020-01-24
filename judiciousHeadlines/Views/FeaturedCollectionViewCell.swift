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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(hex: 0xF3865D)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
