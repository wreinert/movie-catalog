//
//  Movie.swift
//  MVVM-C Sample
//
//  Created by William Reinert on 14/11/22.
//

import Foundation

struct MovieList: Decodable {
    var results: [Movie]
}

struct Movie: Decodable {
    var id: Int
    var title: String
    var overview: String
    var poster_path: String
    var release_date: String
}
