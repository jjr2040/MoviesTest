//
//  MoviesListViewController.swift
//  Movies
//
//  Created Juan Jose Villegas on 3/25/19.
//  Copyright © 2019 Rappi. All rights reserved.
//
//

import UIKit
import RxSwift
import RxCocoa

class MoviesListViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private let presenter: MoviesListPresenterProtocol
    
    init(presenter: MoviesListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: String(describing: MoviesListViewController.self), bundle: Bundle(for: MoviesListViewController.self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }

	override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setupTableViewBindings(for: tableView)
    }
}
