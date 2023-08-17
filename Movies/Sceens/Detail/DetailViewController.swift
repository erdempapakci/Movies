//
//  DetailViewController.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

final class DetailViewController: BaseViewController<DetailViewPresenter> {

    private lazy var detailComponent: DetailViewComponent = .init() &> {
        $0.data = presenter.detailData
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var backgroundImage: UIImageView = .init() &> {
        $0.alpha = 0.3
    }
  
    override func configureViewDidLoad() {
        super.configureViewDidLoad()
        
        presenter.viewDidload()
        view.backgroundColor = .darkGray
      
        configureConstraints()
   
    }
    
    private func configureConstraints() {
        view.addSubview(backgroundImage)
        view.addSubview(detailComponent)
        NSLayoutConstraint.activate([
            detailComponent.topAnchor.constraint(equalTo: view.topAnchor),
            detailComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        backgroundImage.frame = view.frame
    }
 
}
extension DetailViewController: DetailViewProtocol {
    
    func setDetail(data: MovieDetail) {
   
         detailComponent.setData(value: data)
        ImageManager.shared.downloadOrGetCache(url: data.posterPath, for: backgroundImage)
        
    }
}

