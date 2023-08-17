//
//  DetailInfoComponent.swift
//  Movies
//
//  Created by Erdem on 17.08.2023.
//

import UIKit

final class DetailViewInfoComponent: GenericBaseView<InfoEntity>{
    
    private lazy var scrollView: UIScrollView = .init() &> {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.alwaysBounceHorizontal = true
        $0.showsHorizontalScrollIndicator = true

        $0.isScrollEnabled = true
        
    }

    private lazy var releaseDate: UILabel = .init() &> {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 20)
    }
    private lazy var releaseDateHolder: UILabel = .init() &> {
        $0.text = "Release Date"
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 20)
    }
    private lazy var genre: UILabel = .init() &> {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 20)
    }
    private lazy var genreHolder: UILabel = .init() &> {
        $0.text = "Category"
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 20)
    }
    private lazy var language: UILabel = .init() &> {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 20)
    }
    private lazy var languageHolder: UILabel = .init() &> {
        $0.text = "Language"
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 20)
    }
    private lazy var languageStackView: UIStackView = .init(arrangedSubviews: [languageHolder, language]) &> {
        $0.axis = .vertical
        $0.spacing = 10
        
    }
   
   
    private lazy var releaseStackView: UIStackView = .init(arrangedSubviews: [releaseDateHolder, releaseDate]) &> {
        $0.axis = .vertical
        $0.spacing = 10
    }
    private lazy var genreStackView: UIStackView = .init(arrangedSubviews: [genreHolder, genre]) &> {
        $0.axis = .vertical
        $0.spacing = 10
    }
    
    private lazy var infoStackView: UIStackView = .init(arrangedSubviews: [genreStackView, releaseStackView, languageStackView]) &> {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = 10
        $0.distribution = .equalSpacing
    }
    
    
    override func configureView() {
        super.configureView()
        addSubview(scrollView)
        scrollView.addSubview(infoStackView)
        
        configureConstraints()
        configureData()
    }
    
    
    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            infoStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            infoStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            infoStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
          
        ])
        
    }
    private func configureData() {
        
      
        
        releaseDate.text = data?.releaseDate
        genre.text = data?.genre
        language.text = data?.language?.uppercased()
    }
    
}
