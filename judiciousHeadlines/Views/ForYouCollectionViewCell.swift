//
//  ForYouCollectionViewCell.swift
//  judiciousHeadlines
//
//  Created by Wesley Espinoza on 1/24/20.
//  Copyright © 2020 Erick Espinoza. All rights reserved.
//

import Foundation
import UIKit

class ForYouCollectionViewCell: UICollectionViewCell {
    static let identifier = "ForYouCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(hex: 0xF31E57)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
