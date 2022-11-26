//
//  MovieCell.swift
//  MVVM-C Sample
//
//  Created by William Reinert on 15/11/22.
//

import UIKit
import SnapKit

public protocol TNMovieViewDelegate {
    func didTapMovie(selectedMovie: Int)
}

public class TNMovieView: UIView {
    
    struct Constants {
        static let height: CGFloat = 120
        static let width: CGFloat = height/2
        static let margin: CGFloat = 18
    }
    
    lazy public var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        
        return imageView
    }()
    
    lazy public var textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 20)
        
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 12)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        
        return label
    }()
    
//    lazy var selectSwitch: TNSwitch = {
//        let selectSwitch = TNSwitch()
//
//        return selectSwitch
//    }()
    
    public var delegate: TNMovieViewDelegate?
    
    private var index: Int = 0
    private var id: Int?
    
    public init() {
        super.init(frame: .zero)
        setupView()
        setupBindings()
    }
    
    public func setup(title: String, description: String, index: Int, image: UIImage, id: Int) {
        titleLabel.text = title
        descriptionLabel.text = description
        userImageView.image = image
        self.index = index
        self.id = id
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBindings() {
//        selectSwitch.addTarget(self, action: #selector(didUpdateSwitch), for: .valueChanged)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        let cell = sender?.view as! TNMovieView
        self.id = cell.id
        delegate?.didTapMovie(selectedMovie: self.id!)
//        let cell = sender?.view as! TNMovieView
//        print(cell.Id)
    }
    
    @objc private func didUpdateSwitch() {
//        delegate?.didUpdateSwitch(index: index, value: selectSwitch.isOn)
    }
    
}

extension TNMovieView: ViewCoded {
    public func buildViewHierarchy() {
        addSubview(userImageView)
        addSubview(textStackView)
//        addSubview(selectSwitch)
        
        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(descriptionLabel)
    }
    
    public func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(Constants.height)
        }

        userImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Constants.margin)
            make.leading.equalToSuperview().inset(Constants.margin)
            make.bottom.equalToSuperview().inset(Constants.margin)
            make.height.equalTo(userImageView.snp.height)
            make.width.equalTo(Constants.width)
        }

        textStackView.snp.makeConstraints { make in
            make.centerY.equalTo(userImageView.snp.centerY)
            make.leading.equalTo(userImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview()
        }

//        selectSwitch.snp.makeConstraints { make in
//            make.trailing.equalToSuperview().inset(Constants.margin)
//            make.centerY.equalTo(userImageView.snp.centerY)
//        }
    }
    
    public func addAdditionalConfiguration() {

    }
}
