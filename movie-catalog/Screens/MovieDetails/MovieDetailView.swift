//
//  MovieDetailView.swift
//  MVVM-C Sample
//
//  Created by William Reinert on 18/11/22.
//

import Foundation
import UIKit
import SnapKit

class MovieDetailView: UIView {
          
    lazy var movieImage: UIImageView = {
        let movieImage = UIImageView()
        
        return movieImage
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieDetailView: ViewCoded {
    func buildViewHierarchy() {
        addSubview(movieImage)
    }
    
    func setupConstraints() {
            
        movieImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func addAdditionalConfiguration() {
//        backgroundColor = .systemYellow
    }
}
