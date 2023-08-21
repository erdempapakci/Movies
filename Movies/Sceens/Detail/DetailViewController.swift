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
    private lazy var visitButton: UIBarButtonItem = .init() &> {
        $0.tintColor = .white
        $0.target = self
        $0.image = UIImage(named: "imdb")?.withRenderingMode(.alwaysOriginal)
       
        $0.target = self
        $0.action = #selector(visitButtonTapped)
    }
    private lazy var saveButton: UIBarButtonItem = .init() &> {
        $0.tintColor = .white
        $0.target = self
        $0.image = UIImage(systemName: "star")
        
        $0.target = self
        $0.action = #selector(saveButtonTapped)
    }
  
    @objc private func visitButtonTapped() {
        if (presenter.detailData?.imdbID) != nil  {
            presenter.openURL()
        } else {
            showError(errorString: UIErrors.emptyIMDBID.localizedDescription)
        }
        
    }
    @objc private func saveButtonTapped() {
        presenter.saveToCore()
        NotificationCenter.default.post(name: .refreshSaved, object: nil)

    }
  
    override func configureViewDidLoad() {
        super.configureViewDidLoad()
        
        presenter.viewDidload()
        view.backgroundColor = .darkGray
      
        configureConstraints()
   
    }
    
    private func configureConstraints() {
        
        view.addSubview(detailComponent)
        navigationItem.rightBarButtonItems = [  saveButton, visitButton,
        
        ]
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


