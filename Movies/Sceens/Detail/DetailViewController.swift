//
//  DetailViewController.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

final class DetailViewController: BaseViewController<DetailViewPresenter> {

    
    private lazy var detailComponent: DetailViewComponent = .init() &> {
       
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
   
  
    override func configureViewDidLoad() {
        super.configureViewDidLoad()
        
        presenter.viewDidload()
        view.backgroundColor = .darkGray
      
        configureConstraints()
   
    }
    
    private func configureConstraints() {
        
        view.addSubview(detailComponent)
  
       
        NSLayoutConstraint.activate([
            detailComponent.topAnchor.constraint(equalTo: view.topAnchor),
            detailComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    func setTitle(title: String) {
        navigationController?.setLargeTitleStyle(.custom(color: .white, font: .boldSystemFont(ofSize: 25)))
               navigationItem.title = title
    }
 
}
extension DetailViewController: DetailViewProtocol {
    
    func setDetail(data: MovieDetail) {
   
         detailComponent.setData(value: data)
        setTitle(title: data.originalTitle ?? "")
    }
}

