//
//  DetailViewComponent.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

final class DetailViewComponent: GenericBaseView<MovieDetail> {
    private lazy var titleLabel: UILabel = .init() &>  {
        $0.textColor = .green
        $0.font = .boldSystemFont(ofSize: 20)
    }
    private lazy var visitButton: VisitButtonComponent = .init() &> {
        $0.backgroundColor = .systemRed
        $0.data = data?.artistURL
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var iTunesImage: UIImageView = .init() &> {
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        $0.layer.masksToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
 
    private lazy var mainStackView: UIStackView = .init(arrangedSubviews: [titleLabel, iTunesImage, visitButton]) &> {
        $0.axis = .vertical
        $0.spacing = 10
        $0.alignment = .center
        $0.setCustomSpacing(50, after: iTunesImage)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
   


    override func configureView() {
        super.configureView()
        configureData()
        configureConstraints()
      
    }
   
    
    private func configureConstraints() {
        addSubview(mainStackView)
      
       
        
            NSLayoutConstraint.activate([
                mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 200),
                mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
                mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
                mainStackView.heightAnchor.constraint(equalToConstant: 300),
              
            ])
            
        NSLayoutConstraint.activate([
          
            iTunesImage.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            iTunesImage.trailingAnchor.constraint(equalTo: iTunesImage.trailingAnchor),
      
          
        ])
        
        NSLayoutConstraint.activate([
          
            visitButton.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor),
            visitButton.heightAnchor.constraint(equalToConstant: 50),
            visitButton.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 10),
            visitButton.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -10)
      
          
        ])
       
    }
    private func configureData() {
        if let iTunesData = data  {
            ImageManager.shared.downloadOrGetCache(url: iTunesData.mainImage, for: self.iTunesImage)
          
            titleLabel.text = iTunesData.artistName
            visitButton.data = iTunesData.artistURL
           
        } else {
            
        }
    }
}
