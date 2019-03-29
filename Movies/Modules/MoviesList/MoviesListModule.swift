//
//  MoviesListModule.swift
//  Movies
//
//  Created Juan Jose Villegas on 3/25/19.
//  Copyright © 2019 Rappi. All rights reserved.
//
//

import UIKit

protocol MoviesListModuleProtocol: AnyObject {
    
}

class MoviesListModule {

    private let presenter: MoviesListPresenterProtocol
    
    init() {
        let wireframe = MoviesListWireframe()
        let interactor = MoviesListInteractor()
        
        let presenter = MoviesListPresenter(wireframe: wireframe, interactor: interactor)
        
        self.presenter = presenter
    }
}

extension MoviesListModule: MoviesListModuleProtocol {
    
    func setupIn(tabBarController: UITabBarController, atIndex index: Int) {
        presenter.setupIn(tabBarController: tabBarController, atIndex: index)
    }
}
