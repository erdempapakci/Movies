//
//  SavedTableViewCell.swift
//  Movies
//
//  Created by Erdem on 18.08.2023.
//

import UIKit
final class SavedTableViewCell: GenericTableViewCell<SavedEntity>, CellProvidable {
    typealias V = SavedEntity
    
    private lazy var titleLabel: UILabel = .init() &>  {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        
    }
    private lazy var movieImage: UIImageView = .init() &>  {
        $0.translatesAutoresizingMaskIntoConstraints = false

        
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = false
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowOffset = CGSize.zero
        $0.layer.shadowRadius = 10

        $0.layer.shadowPath = UIBezierPath(roundedRect: $0.bounds, cornerRadius: 10).cgPath
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.applyBlurEffect()
     
    }
    
  
    override func configureSubViews() {
        super.configureSubViews()
     
        configureConstraints()
    }
    private func configureConstraints() {
        addSubview(movieImage)
        addSubview(titleLabel)
       
        
        NSLayoutConstraint.activate([
            
            movieImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            movieImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            movieImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            movieImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: movieImage.topAnchor),
     
        ])
    }
    
    func configure(_ item: SavedEntity) {
       
        
        titleLabel.text = item.originalTitle
        movieImage.image = item.posterImage 
    }
    
}
