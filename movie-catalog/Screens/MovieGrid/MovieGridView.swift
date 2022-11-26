//
//  MovieGridView.swift
//  MVVM-C Sample
//
//  Created by William Reinert on 14/11/22.
//

import Foundation
import UIKit
import SnapKit

class MovieGridView: UIView {
        
    lazy var searchBar: UISearchController = {
        let searchBar = UISearchController()
        
        return searchBar
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieGridView: ViewCoded {
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
    
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func addAdditionalConfiguration() {
        backgroundColor = .systemYellow
    }
    
    
}
