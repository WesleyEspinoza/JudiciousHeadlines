//
//  Coordinator.swift
//  judiciousHeadlines
//
//  Created by Wesley Espinoza on 1/22/20.
//  Copyright © 2020 Erick Espinoza. All rights reserved.
//

import Foundation
import UIKit
// protocol for Coordinators
protocol Coordinator {
    var window: UIWindow {get set}
    
    func start()
}
