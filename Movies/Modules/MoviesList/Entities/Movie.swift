//
//  Movie.swift
//  Movies
//
//  Created by Juan Jose Villegas on 3/25/19.
//  Copyright © 2019 Rappi. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    let title: String
    let overview: String
    let originalLanguage: String
    let voteAvarage: Float
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case originalLanguage = "original_language"
        case voteAvarage = "vote_average"
        case posterPath = "poster_path"
    }
}
