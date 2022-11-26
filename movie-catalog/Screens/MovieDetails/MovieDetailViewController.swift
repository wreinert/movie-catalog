//
//  MovieDetailViewController.swift
//  MVVM-C Sample
//
//  Created by William Reinert on 15/11/22.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController {
    
    lazy private var contentView: MovieDetailView = {
        MovieDetailView()
    }()
    
    var movieId: Int?
    var viewModel: MovieDetailViewModelProtocol
    
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getMovieDetails(movieId: movieId!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = contentView
        setup()
        showHover()
    }
    
    func setup() {
        setupBindings()
    }
    
    private func setupBindings() {
        viewModel.didUpdateMovie = { [weak self] in
            self?.contentView.movieImage.image = self?.viewModel.movieImage
        }
    }

    func showHover() {
        let viewModel = self.viewModel
        let viewController = HoverViewController(viewModel: viewModel as! MovieDetailViewModel)
        
        viewController.modalPresentationStyle = .formSheet
        present(viewController, animated: true, completion: nil)
    }
}
