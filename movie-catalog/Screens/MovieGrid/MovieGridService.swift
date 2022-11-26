//
//  MovieGridService.swift
//  MVVM-C Sample
//
//  Created by William Reinert on 14/11/22.
//

import Foundation
import UIKit

protocol MovieGridServiceProtocol {
    func fetchFilms(completionHandler: @escaping (MovieList) -> Void)
}

protocol MovieCellServiceProtocol {
    func fetchImage(imageURL: String, completionHandler: @escaping (UIImage) -> Void)
}

class MovieGridService: MovieGridServiceProtocol, MovieCellServiceProtocol {
    
    let domainUrlString = "https://api.themoviedb.org/3/movie/popular?api_key="
    let apiKey = "7837a3f390108f6aa58f64c6797b1dce"
    
    func fetchFilms(completionHandler: @escaping (MovieList) -> Void) {
        let url = URL(string: domainUrlString + apiKey)!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            
            if let data = data,
               let filmSummary = try! JSONDecoder().decode(MovieList?.self, from: data) {
                completionHandler(filmSummary)
            }
        })
        task.resume()
    }
    
    func fetchImage(imageURL: String, completionHandler: @escaping (UIImage) -> Void) {
        if let url = URL(string: "https://image.tmdb.org/t/p/w500/\(imageURL)") {
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error)
                }
                
                if let data = data {
                    DispatchQueue.main.async {
                        completionHandler(UIImage(data: data)!)
                    }
                }
            }
            task.resume()
        }
        
    }
    

}
