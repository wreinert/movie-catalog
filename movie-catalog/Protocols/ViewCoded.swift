//
//  ViewCoded.swift
//  MVVM-C Sample
//
//  Created by William Reinert on 14/11/22.
//

import Foundation

public protocol ViewCoded {
    func buildViewHierarchy()
    func setupConstraints()
    func addAdditionalConfiguration()
}

public extension ViewCoded {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        addAdditionalConfiguration()
    }
}
