//
//  MovieCell.swift
//  MVVM-C Sample
//
//  Created by William Reinert on 15/11/22.
//

import UIKit
import SnapKit

class MovieViewCell: UITableViewCell {
    
    lazy var movieSummaryView: TNMovieView = {
        let view = TNMovieView()
        
        return view
    }()
    
    func setup(_ movieModel: Movie, index: Int) {
        var movieImage = UIImage(named: "")
        MovieGridService().fetchImage(imageURL: movieModel.poster_path) { image in
            movieImage = image
            self.movieSummaryView.setup(title: movieModel.title, description: movieModel.overview, index: index, image: movieImage!, id: movieModel.id)
        }
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MovieViewCell: ViewCoded {
    func buildViewHierarchy() {
        contentView.addSubview(movieSummaryView)
    }
    
    func setupConstraints() {
        movieSummaryView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func addAdditionalConfiguration() {
        
    }
}

