//
//  MovieGridViewModel.swift
//  MVVM-C Sample
//
//  Created by William Reinert on 14/11/22.
//

import Foundation

protocol MovieGridViewModelProtocol {
    func getMovies()
    func filterMovies(text: String)
    
    var movieTitles: [Movie] {get}
    var filteredMovieTitles: [Movie] {get}
    var didUpdateMovies: (() -> Void)? { get set }
}

class MovieGridViewModel: MovieGridViewModelProtocol {
    
    let service: MovieGridServiceProtocol
    var movieTitles = [Movie]()
    var filteredMovieTitles = [Movie]()
    
    var didUpdateMovies: (() -> Void)?
    
    init(service: MovieGridService) {
        self.service = service
    }
    
    func getMovies() {
        service.fetchFilms { movie in
            self.movieTitles = movie.results
            self.filteredMovieTitles = self.movieTitles
            
            DispatchQueue.main.async {
                self.didUpdateMovies!()
            }
        }
    }
    
    func filterMovies(text: String) {
        filteredMovieTitles = text.isEmpty ? self.movieTitles : self.movieTitles.filter({ $0.title.contains(text) })
        
        didUpdateMovies?()
    }
}
