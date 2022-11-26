//
//  MovieDetailService.swift
//  MVVM-C Sample
//
//  Created by William Reinert on 18/11/22.
//

import Foundation
import UIKit

protocol MovieDetailServiceProtocol {
    func fetchFilm(movieId: Int, completionHandler: @escaping (MovieDetail) -> Void)
    func fetchImage(imageURL: String, completionHandler: @escaping (UIImage) -> Void)
//    var movieId: Int {get}
}

class MovieDetailService: MovieDetailServiceProtocol {
    
    let domainUrlString = "https://api.themoviedb.org/3/movie/"
    let apiKey = "7837a3f390108f6aa58f64c6797b1dce"
//    var movieId = 0
    
    func fetchFilm(movieId: Int, completionHandler: @escaping (MovieDetail) -> Void) {
        let url = URL(string: domainUrlString + String(movieId) + "?api_key=" + apiKey)!
        
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
               let filmDetail = try! JSONDecoder().decode(MovieDetail?.self, from: data) {
                completionHandler(filmDetail)
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

