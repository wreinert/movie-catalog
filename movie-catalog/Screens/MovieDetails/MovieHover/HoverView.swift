//
//  HoverView.swift
//  MVVM-C Sample
//
//  Created by William Reinert on 21/11/22.
//

import Foundation
import UIKit
import SnapKit

class HoverView: UIView {
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        
        return titleLabel
    }()
    
    lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 0
        
        return descriptionLabel
    }()
    
    lazy var releaseDateLabel: UILabel = {
        let releaseDate = UILabel()
        
        return releaseDate
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HoverView: ViewCoded {
    func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(releaseDateLabel)
    }
    
    func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        releaseDateLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = UIColor(white: 1, alpha: 0.5)
        isOpaque = true
    }
}
