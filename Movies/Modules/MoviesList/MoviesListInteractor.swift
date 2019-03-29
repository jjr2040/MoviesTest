//
//  MoviesListInteractor.swift
//  Movies
//
//  Created Juan Jose Villegas on 3/25/19.
//  Copyright © 2019 Rappi. All rights reserved.
//
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

protocol MoviesListInteractorProtocol: AnyObject {
    var moviesObservable: Observable<[Movie]> { get }
    var movies: [Movie] { get }
}

class MoviesListInteractor: MoviesListInteractorProtocol {
    
    var moviesObservable: Observable<[Movie]> {
        return moviesBehaviour.asObservable()
    }
    
    var movies: [Movie] {
        return moviesBehaviour.value
    }
    
    private let moviesBehaviour = BehaviorRelay<[Movie]>(value: [])
    private let baseMoviesURL = "https://api.themoviedb.org/3"
    private let apiKey = "c80a68c0217b7acc74b5b94e8624a9bd"
    
    init() {
        fetchMovies()
    }
    
    private func fetchMovies() {
        let url = "\(baseMoviesURL)/trending/movie/day"
        let params: [String : Any] = [ "api_key": apiKey ]
        Alamofire.request(url, method: .get,
                          parameters: params).responseJSON { [weak self] responseData in
                            
                            responseData.result.ifSuccess {
                                guard let data = responseData.result.value as? [String: Any],
                                    let results = data["results"] as? [[String: Any]],
                                    let json = try? JSONSerialization.data(withJSONObject: results),
                                    let movies = try? JSONDecoder().decode([Movie].self, from: json) else {
                                        print("Error")
                                        return
                                }
                                
                                self?.moviesBehaviour.accept(movies)
                            }
        }
    }
}
