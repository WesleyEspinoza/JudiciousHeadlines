//
//  AppCoordinator.swift
//  judiciousHeadlines
//
//  Created by Wesley Espinoza on 1/22/20.
//  Copyright © 2020 Erick Espinoza. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator{
    let userdefaults = UserDefaults.standard
    func start() {
        
        if (userdefaults.bool(forKey: "HasLaunchedBefore")){
            let vc = NewsFeedViewController()
            vc.coordinator = self
            let navController = UINavigationController(rootViewController: vc)
            navController.isNavigationBarHidden = false
            
            window.rootViewController = navController
        } else {
            let vc = CategorySelectionController()
            vc.coordinator = self
            let navController = UINavigationController(rootViewController: vc)
            navController.isNavigationBarHidden = false
            
            window.rootViewController = navController
        }

        
    }
    
var window: UIWindow
init(window: UIWindow) {
    self.window = window
    }
    
}
