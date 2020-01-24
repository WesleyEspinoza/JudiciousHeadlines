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
    func start() {
        let vc = NewsFeedViewController()
        vc.coordinator = self
        let navController = UINavigationController(rootViewController: vc)
        navController.isNavigationBarHidden = false
        
        window.rootViewController = navController
        
    }
    
var window: UIWindow
init(window: UIWindow) {
    self.window = window
    }
    
}
