//
//  AppCoordinator.swift
//  Movies
//
//  Created by Juan Jose Villegas on 3/25/19.
//  Copyright © 2019 Rappi. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    var rootViewController: UIViewController?
    
    init() {
        setupInitialViewControllers()
    }
    
    func setupInitialViewControllers() {
        let tabBarController = UITabBarController()
        let movieListModule = MoviesListModule()
        
        movieListModule.setupIn(tabBarController: tabBarController, atIndex: 0)
        
        self.rootViewController = tabBarController
    }
}
