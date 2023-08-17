//
//  DetailViewComponent.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

final class DetailViewComponent: GenericBaseView<MovieDetail> {
    
    private lazy var scrollView: UIScrollView = .init() &> {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.alwaysBounceVertical = true
        $0.showsVerticalScrollIndicator = true
        $0.isScrollEnabled = true
        
    }
   
    
    private lazy var infoComponent: DetailViewInfoComponent = .init() &> {
        $0.contentMode = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        
    }
    private lazy var overviewComponent: DetailOverviewComponent = .init() &> {
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        
    }
    private lazy var movieImage: UIImageView = .init() &> {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = false
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowOffset = CGSize.zero
        $0.layer.shadowRadius = 10
        $0.layer.cornerRadius = 15
        $0.layer.shadowPath = UIBezierPath(roundedRect: $0.bounds, cornerRadius: 10).cgPath
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
     
    }
    
    private lazy var bottomButtonsComponent: DetailViewBottomComponent = .init() &> {
        $0.isHidden = false
    }
    private lazy var mainStackView: UIStackView = .init(arrangedSubviews: [movieImage, infoComponent, overviewComponent, bottomButtonsComponent]) &> {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .center
     
    }
    
    override func configureView() {
        super.configureView()
        
        configureConstraints()
        configureData()
        
        
    }
    
    private func configureConstraints() {
        addSubview(scrollView)
        scrollView.addSubview(mainStackView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leftAnchor.constraint(equalTo: leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
       
  
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainStackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            mainStackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            mainStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            movieImage.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -20),
            movieImage.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 20),
            
           
         
        ])
       
   
       
        
        
    }
    private func configureData() {
        if let movieData = data  {
            ImageManager.shared.downloadOrGetCache(url: movieData.posterPath, for: self.movieImage)
            
            
            let infoEntity = InfoEntity(voteCount: "\(movieData.voteCount ?? 0 )", releaseDate: movieData.releaseDate, genre: movieData.genres?.first?.name, status: movieData.status, imdbID: movieData.imdbID, language: movieData.originalLanguage)
            
            infoComponent.setData(value: infoEntity)
            overviewComponent.setData(value: movieData.overview)
            
            
        }
    }
}
