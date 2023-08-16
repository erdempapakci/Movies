//
//  MainPresenter.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation
import Combine

class MainPresenter: MainPresenterProtocol {
   
    var data = [MovieEntity]()
    weak var delegate: MainPresenterDelegate?
    unowned var view: MainViewProtocol
    var interactor: MainInteractorProtocol
    var router: MainRouterProtocol
    var viewState: ViewStateBlock?
    var cancelables = Set<AnyCancellable>()
    
    init(view: MainViewProtocol, interactor: MainInteractorProtocol, router: MainRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func clearData() {
        data = []
        view.reloadData()
    }
    func searchData(query: String) {
        
        delegate?.handleState(state: .loading)
      
        interactor.getListOfQuery(query: query)
            
            .receive(on: DispatchQueue.main)
            
            .sink { compl in
                
                switch compl {
                case .finished:
                    self.delegate?.handleState(state: .finished)
                case .failure(let error):
                   
                    self.delegate?.handleState(state: .failure(error))
                  
                }
            } receiveValue: { [weak self] response in
                
                guard let self = self else {return}
                data = response.results ?? []
               
                if data.isEmpty {
                    self.delegate?.handleState(state: .noData)
                } else {
                
                    self.delegate?.handleState(state: .newData)
                }
        
            }
            
            .store(in: &cancelables)
        
        
    }
    
    func viewDidload(){
        view.setTitle()
    
    }
   
   
    
    func didSelectItem(_ index: Int) -> String {
       
        guard let id = data[index].id else {return ""}
        let idString = "\(id)"
        return idString
         
    }
    func count() -> Int {
      
        return data.count
    }
    func cellForRowAt(index: Int) -> MovieEntity {
       
        return data[index]
    }
    func routeToDetail(id: String) {
       
        router.routeToDetail(id: id)
    }
    
    
}
