//
//  ViewController.swift
//  judiciousHeadlines
//
//  Created by Wesley Espinoza on 1/22/20.
//  Copyright © 2020 Erick Espinoza. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController{
    var coordinator: Coordinator!
    var headlinesCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Headlines"
        setupViews()
    }
    
    func setupViews(){
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonPressed))
        self.navigationItem.leftBarButtonItems = [editButton]
        let flowLayout = UICollectionViewFlowLayout()
        headlinesCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
        headlinesCollectionView.backgroundColor = UIColor(hex: 0xEFEFEF)
        headlinesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        headlinesCollectionView.register(FeaturedCollectionViewCell.self, forCellWithReuseIdentifier: FeaturedCollectionViewCell.identifier)
        headlinesCollectionView.register(ForYouCollectionViewCell.self, forCellWithReuseIdentifier: ForYouCollectionViewCell.identifier)
        headlinesCollectionView.delegate = self
        headlinesCollectionView.dataSource = self
        self.view.addSubview(headlinesCollectionView)
    }
    
    @objc func editButtonPressed(){
        
    }
}


extension NewsFeedViewController: UICollectionViewDelegate{
    
}

extension NewsFeedViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    // NOTE: number of cells to return
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        // NOTE: switch statment to return different cells at different indexs
        switch indexPath.section {
        case 0:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedCollectionViewCell.identifier, for: indexPath) as! FeaturedCollectionViewCell
            break
        case 1:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForYouCollectionViewCell.identifier, for: indexPath) as! ForYouCollectionViewCell
            break
        default:
            cell = UICollectionViewCell()
        }
        return cell
    }

}

extension NewsFeedViewController: UICollectionViewDelegateFlowLayout {


    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        case 0:
            return CGSize(width: headlinesCollectionView.bounds.width, height: headlinesCollectionView.bounds.height / 2 )
        case 1:
            return CGSize(width: headlinesCollectionView.bounds.width, height: headlinesCollectionView.bounds.height )
        default:
            return CGSize.zero
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 0, bottom: -40, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

