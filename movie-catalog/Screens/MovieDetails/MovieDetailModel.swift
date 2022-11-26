//
//  MovieDetailModel.swift
//  MVVM-C Sample
//
//  Created by William Reinert on 18/11/22.
//

import Foundation

struct MovieDetail: Decodable {
    var id: Int
    var title: String
    var overview: String
    var poster_path: String
    var release_date: String
}
