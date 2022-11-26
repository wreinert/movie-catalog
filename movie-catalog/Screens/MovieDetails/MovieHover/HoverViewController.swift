//
//  ModalViewController.swift
//  MVVM-C Sample
//
//  Created by William Reinert on 21/11/22.
//

import Foundation
import UIKit

class HoverViewController: UIViewController {
     
    lazy private var contentView: HoverView = {
        HoverView()
    }()
    
    var viewModel: MovieDetailViewModelProtocol
    
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        view = contentView
        setup()
    }
    
    func setup() {
        setupBindings()
    }
    
    private func setupBindings() {
        contentView.titleLabel.text = viewModel.movieDetails?.title
        contentView.descriptionLabel.text = viewModel.movieDetails?.overview
        contentView.releaseDateLabel.text = viewModel.movieDetails?.release_date
    }
}
