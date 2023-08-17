//
//  MainViewController.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit
import Combine

final class EmptyResultComponent: GenericBaseView<Bool> {
    override var data: Bool? {
            didSet {
                handleShowing()
            }
        }
    private lazy var resultNotFoundImage: UIImageView = .init() &> {
        $0.image = UIImage(systemName: "heart.fill")
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var resultNotFoundTitle: UILabel = .init() &> {
        $0.font = .systemFont(ofSize: 10)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var mainStackView: UIStackView = .init(arrangedSubviews: [resultNotFoundImage, resultNotFoundTitle]) &> {
        $0.axis = .vertical
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
   
    override func configureView() {
        super.configureView()
       
        configureConstrants()
        handleShowing()
   
    }
    private func handleShowing() {
           guard let show = data else { return }
           
           if show {
               if mainStackView.superview == nil {
                   addSubview(mainStackView)
                   NSLayoutConstraint.activate([
                       mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
                       mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
                   ])
               }
           } else {
               mainStackView.removeFromSuperview()
           }
       }
    private func configureConstrants() {
       
        mainStackView.frame = .init(x: 50, y: 50, width: 100, height: 200)
    }
}

final class MainViewController: BaseViewController<MainPresenter> {
    
    var cancellables = Set<AnyCancellable>()
    var adapter: MainCollectionViewAdapter!
  
  
    private lazy var search: SearchComponent = .init() &> {
        $0.searchBar.translatesAutoresizingMaskIntoConstraints = false
        
    }
    private lazy var emptyResultComponent: EmptyResultComponent = .init() &> {
        $0.data = false
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.largeContentTitle = ""
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
        view.addSubview(emptyResultComponent)
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
        NSLayoutConstraint.activate([
            
            emptyResultComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emptyResultComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emptyResultComponent.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            emptyResultComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100),
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
            
            self.emptyResultComponent.data = true
           
            
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
       
        movieListCellComponent.collectionView.reloadData()
    
    }
    
    
}

