//
//  MovieGridViewController.swift
//  MVVM-C Sample
//
//  Created by William Reinert on 14/11/22.
//

import Foundation
import UIKit

protocol MovieGridCoordinatorProtocol {
    func showMovieDetailScreen(view: Int)
}

class MovieGridViewController: UIViewController {
    
    var coordinator: MovieGridCoordinator?
    var viewModel: MovieGridViewModelProtocol
    lazy private var contentView: MovieGridView = {
        MovieGridView()
    }()
    
    init(viewModel: MovieGridViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getMovies()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = contentView
        
        setup()
    }
    
    func setup() {
        setupSearchBar()
        setupTableView()
        setupBindings()
    }
    
    private func setupBindings() {
        viewModel.didUpdateMovies = { [weak self] in
            self?.contentView.tableView.reloadData()
        }
    }
}

extension MovieGridViewController: UITableViewDataSource {
    
    private func setupTableView() {
        let tableView = contentView.tableView
        tableView.register(MovieViewCell.self, forCellReuseIdentifier: "MovieViewCell")
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.filteredMovieTitles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MovieViewCell()
        cell.setup(viewModel.filteredMovieTitles[indexPath.row], index: indexPath.row)
        cell.movieSummaryView.delegate = self
        
        return cell
    }
}

extension MovieGridViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.filterMovies(text: searchController.searchBar.text ?? "")
    }
    
    private func setupSearchBar() {
        contentView.searchBar.searchBar.sizeToFit()
        navigationItem.titleView = contentView.searchBar.searchBar
        contentView.searchBar.hidesNavigationBarDuringPresentation = false
        contentView.searchBar.searchResultsUpdater = self
        contentView.searchBar.definesPresentationContext = true
    }
}

extension MovieGridViewController: TNMovieViewDelegate {
    func didTapMovie(selectedMovie: Int) {
        coordinator?.showMovieDetailScreen(view: selectedMovie)
    }
}

    
    
