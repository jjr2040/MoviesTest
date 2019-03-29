//
//  MoviesListWireframe.swift
//  Movies
//
//  Created Juan Jose Villegas on 3/25/19.
//  Copyright © 2019 Rappi. All rights reserved.
//
//

import UIKit

enum MoviesListTransition {
    case showDetailFor(movie: Movie)
    case setupIn(tabBarController: UITabBarController, index: Int, presenter: MoviesListPresenterProtocol)
}

class MoviesListWireframe {
    
    func performTransition(transition: MoviesListTransition, onCompletion completion: (() -> ())? = nil) {
        
        switch transition {
        case .setupIn(tabBarController: let tabBarController, index: let index, presenter: let presenter):
            showIn(tabBarController: tabBarController, index: index, presenter: presenter)
        case .showDetailFor(movie: let movie):
            showDetailFor(movie: movie)
        }
    }
}

private extension MoviesListWireframe {
    
    func showIn(tabBarController: UITabBarController, index: Int, presenter: MoviesListPresenterProtocol) {
        
        let navigationController = UINavigationController()
        let moviesListController = MoviesListViewController(presenter: presenter)
        
        moviesListController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: index)
        moviesListController.title = "Movies"
        
        navigationController.setViewControllers([moviesListController], animated: false)
        
        if tabBarController.viewControllers == nil {
            tabBarController.viewControllers = [navigationController]
        } else {
            tabBarController.viewControllers?.insert(navigationController, at: index)
        }
    }
    
    func showDetailFor(movie: Movie) {
        // TODO: Show Detail for movie
    }
}
