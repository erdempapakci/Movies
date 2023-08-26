//
//  MainViewController.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit
import Combine

final class MainViewController: BaseViewController<MainPresenter> {
    
    var cancellables = Set<AnyCancellable>()
    var adapter: MainCollectionViewAdapter!
  
  
    private lazy var search: SearchComponent = .init() &> {
        $0.searchBar.translatesAutoresizingMaskIntoConstraints = false
        
    }
   
   
    private lazy var movieListCellComponent: MovieListCellComponents = {
        
        let layout = MovieListCellComponents(adapter: adapter)
        layout.translatesAutoresizingMaskIntoConstraints = false
        return layout
    }()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidload()
        
    }
   
    override func configureViewDidLoad() {
        super.configureViewDidLoad()
       
        implementComponents()
        configureSearch()
        
    }
    
    private func configureSearch() {
        
        search.becomeFirstResponder()
        search.searchResultsUpdater = search
        navigationItem.searchController = search
     
        search.textSearch
            .receive(on: DispatchQueue.main)
            .sink { [weak self] text in
                guard let self = self else {return}
                if text.count > 2 {
                    self.presenter.searchData(query: text)
                } else {
                    presenter.clearData()
                }
                   
  
        }
        .store(in: &cancellables)
    }
 
    private func implementComponents() {
        
      
        view.addSubview(movieListCellComponent)
        view.addSubview(search.searchBar)
       
        NSLayoutConstraint.activate([
            search.searchBar.topAnchor.constraint(equalTo: view.topAnchor)
        
        ])
      
        NSLayoutConstraint.activate([
            
            movieListCellComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieListCellComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieListCellComponent.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            movieListCellComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
    }
    
    
    
}
extension MainViewController: MainPresenterDelegate {
    func handleState(state: ViewState) {
        self.hideActivityIndicator()
        switch state {
        case .loading:
            self.showActivityIndicator()
        case .newData:
           
            movieListCellComponent.collectionView.reloadData()
        case .moreData:
           break
        case .failure(let string):
            
            self.showError(error: string)
        case .finished:
            self.hideActivityIndicator()
          
        case .noData:
            
            presenter.clearData()
           
            
        }
    }
    
    
}


extension MainViewController: MainViewProtocol {
    func showIndicator() {
        self.showActivityIndicator()
    }
    
    func hideIndicator() {
        self.hideActivityIndicator()
    }

    func setTitle() {
        
        navigationController?.setLargeTitleStyle(.custom(color: .black, font: .boldSystemFont(ofSize: 30)))
               navigationItem.title = "Search"
        
    }
    func reloadData() {
       
        DispatchQueue.main.async {
            self.movieListCellComponent.collectionView.reloadData()
        }
      
    
    }
    
    
}

