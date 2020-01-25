//
//  CatagorySelectionController.swift
//  judiciousHeadlines
//
//  Created by Wesley Espinoza on 1/24/20.
//  Copyright © 2020 Erick Espinoza. All rights reserved.
//


import UIKit

class CategorySelectionController: UIViewController{
    var coordinator: Coordinator!
    let userdefaults = UserDefaults.standard
    var selectedCategories: [String] = []
    var headlinesCollectionView: UICollectionView!
    let categories: [String] = ["Colleges and Universities", "Breaking News", "Current Events", "Environmental", "Government", "Magazines", "Media", "Sports", "Politics", "Religion-and-Spirituality", "Technology", "Start Ups", "Stocks", "Music", "EDM", "Hip-Hop", "R&B and Rap", "Pop Music", "Medicine", "World Affairs", "Economy", "contraversial", "Astrology", "Business",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Catagories"
        setupViews()
    }
    
    func setupViews(){
        let startButton = UIBarButtonItem(title: "Start", style: .done, target: self, action: #selector(start))
        
        self.navigationItem.rightBarButtonItems = [startButton]
        headlinesCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: generateLayout())
        headlinesCollectionView.backgroundColor = UIColor(hex: 0xEFEFEF)
        headlinesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        headlinesCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        headlinesCollectionView.delegate = self
        headlinesCollectionView.dataSource = self
        self.view.addSubview(headlinesCollectionView)
    }
    @objc func start(){
        userdefaults.set(selectedCategories, forKey: "SelectedCategories")
        userdefaults.set(true, forKey: "HasLaunchedBefore")
        coordinator.start()
    }
    
    func generateLayout() -> UICollectionViewLayout{
        
        let oneItem = NSCollectionLayoutItem(
          layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(2/6)))
        oneItem.contentInsets = NSDirectionalEdgeInsets(top: 35, leading: 8, bottom: 8, trailing: 8)
        

        let doubleItem = NSCollectionLayoutItem(
          layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/2),
            heightDimension: .fractionalHeight(2/1)))
        doubleItem.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 50, trailing: 8)

        let doubleGroup = NSCollectionLayoutGroup.horizontal(
          layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1/6)),
          subitems: [doubleItem, doubleItem])
        
        let nestedGroup = NSCollectionLayoutGroup.vertical(
          layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1.0)),
          subitems: [oneItem, doubleGroup])

        let section = NSCollectionLayoutSection(group: nestedGroup)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}


extension CategorySelectionController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! CategoryCollectionViewCell
        if selectedCell.wasSelected {
            selectedCell.wasSelected = false
            selectedCategories = selectedCategories.filter {$0 != selectedCell.title}
        } else {
            selectedCell.wasSelected = true
            selectedCategories.append(selectedCell.title)
        }
        
    }
}

extension CategorySelectionController: UICollectionViewDataSource{
    // NOTE: number of cells to return
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = CategoryCollectionViewCell()
        // NOTE: switch statment to return different cells at different indexs
        
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        cell.title = categories[indexPath.row]
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
}

extension CategorySelectionController: UICollectionViewDelegateFlowLayout {
    
    
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


