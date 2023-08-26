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
  
 
     var search: SearchComponent!
   
    private lazy var movieListCellComponent: MovieListCellComponents = {
        
        let layout = MovieListCellComponents(adapter: adapter)
        layout.translatesAutoresizingMaskIntoConstraints = false
        return layout
    }()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter.viewDidload()
        
    }
   
    override func configureViewDidLoad() {
        super.configureViewDidLoad()
       
        implementComponents()
        configureSearch()
        
    }
    
    private func configureSearch() {
        search = SearchComponent(searchResultsController: nil)
        navigationItem.searchController = search
        search.textSearch
            .receive(on: DispatchQueue.main)
            .sink { [weak self] text in
                guard let self = self else {return}
                if text.count > 2 {
                    self.presenter.searchData(query: text)
                } else {
                    presenter.clearData()
                    setTitle()
                }
                   
  
        }
        .store(in: &cancellables)
    }
 
    private func implementComponents() {
        
       
        view.addSubview(movieListCellComponent)
     
      
        NSLayoutConstraint.activate([
            
            movieListCellComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieListCellComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieListCellComponent.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
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
        navigationItem.largeTitleDisplayMode = .always
        
    }
    func reloadData() {
       
        DispatchQueue.main.async {
            self.movieListCellComponent.collectionView.reloadData()
        }
      
    
    }
    
    
}

