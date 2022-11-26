//
//  MovieDetailViewModel.swift
//  MVVM-C Sample
//
//  Created by William Reinert on 18/11/22.
//

import Foundation
import UIKit

protocol MovieDetailViewModelProtocol {
    func getMovieDetails(movieId: Int)
    var movieDetails: MovieDetail? {get}
    var movieImage: UIImage? {get}
    var didUpdateMovie: (() -> Void)? {get set}
}

class MovieDetailViewModel: MovieDetailViewModelProtocol {
    
    var movieDetails: MovieDetail?
    var movieImage: UIImage?
    let service: MovieDetailServiceProtocol
    
    var didUpdateMovie: (() -> Void)?
    
    init(service: MovieDetailService) {
        self.service = service
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getMovieDetails(movieId: Int) {
        service.fetchFilm(movieId: movieId) { movie in
            self.movieDetails = movie
            self.service.fetchImage(imageURL: movie.poster_path) { image in
                self.movieImage = image
                
                DispatchQueue.main.async {
                    self.didUpdateMovie!()
                }
            }
        }
    }
}
