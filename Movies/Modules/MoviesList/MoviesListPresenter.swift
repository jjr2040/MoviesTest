//
//  MoviesListPresenter.swift
//  Movies
//
//  Created Juan Jose Villegas on 3/25/19.
//  Copyright © 2019 Rappi. All rights reserved.
//
//

import UIKit
import RxSwift

protocol MoviesListPresenterProtocol: AnyObject {
    
    func setupTableViewBindings(for tableView: UITableView)
    func setupIn(tabBarController: UITabBarController, atIndex index: Int)
}

enum MoviesListAction {
    case didTapButton
    case dismiss
}

class MoviesListPresenter {
    
    private let wireframe: MoviesListWireframe
    private let interactor: MoviesListInteractorProtocol
    private let disposeBag = DisposeBag()
    
    init(wireframe: MoviesListWireframe, interactor: MoviesListInteractorProtocol) {
        self.wireframe = wireframe
        self.interactor = interactor
    }
}

extension MoviesListPresenter: MoviesListPresenterProtocol {
    
    func setupTableViewBindings(for tableView: UITableView) {
        
        let celIdentifier = "Cell"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: celIdentifier)
        
        interactor
            .moviesObservable.bind(to: tableView.rx.items(cellIdentifier:
            celIdentifier, cellType: UITableViewCell.self)) { _, element, cell in
                cell.textLabel?.text = element.title
        }.disposed(by: disposeBag)
        
        tableView.rx.itemSelected.bind { [weak self] indexPath in
            
            guard let `self` = self else { return }
            
            let movieSeleted = self.interactor.movies[indexPath.row]
            let transition: MoviesListTransition = .showDetailFor(movie: movieSeleted)
            self.wireframe.performTransition(transition: transition)
        }.disposed(by: disposeBag)
    }
    
    func setupIn(tabBarController: UITabBarController, atIndex index: Int) {
        wireframe.performTransition(transition: .setupIn(tabBarController: tabBarController, index: index, presenter: self))
    }
}
