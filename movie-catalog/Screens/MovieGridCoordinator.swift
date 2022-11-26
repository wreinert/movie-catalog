//
//  MovieGridCoordinator.swift
//  MVVM-C Sample
//
//  Created by William Reinert on 14/11/22.
//

import Foundation
import UIKit

final class MovieGridCoordinator: Coordinator {
    
    var currentViewController: UIViewController?
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        let service = MovieGridService()
        let viewModel = MovieGridViewModel(service: service)
        let viewController = MovieGridViewController(viewModel: viewModel)
        
        viewController.coordinator = self
        navigationController?.pushViewController(viewController, animated: true)
        currentViewController = viewController
    }
}

extension MovieGridCoordinator: MovieGridCoordinatorProtocol {
    func showMovieDetailScreen(view: Int) {
        let service = MovieDetailService()
        let viewModel = MovieDetailViewModel(service: service)
        let viewController = MovieDetailViewController(viewModel: viewModel)
        
        viewController.movieId = view
        navigationController?.pushViewController(viewController, animated: true)
        currentViewController = viewController
    }
}
