//
//  DetailViewPresenter.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation
import Combine
import UIKit
final class DetailViewPresenter: DetailViewPresenterProtocol {
    
    
    var cancellables = Set<AnyCancellable>()
    
    @Published var detailData: MovieDetail?
    weak var view: DetailViewProtocol?
    var interactor: DetailViewInteractorProtocol
    var router: DetailViewRouterProtocol
    var id: String
    
    init( view: DetailViewProtocol? = nil, interactor: DetailViewInteractorProtocol, router: DetailViewRouterProtocol, id: String) {
    
        self.view = view
        self.interactor = interactor
        self.router = router
        self.id = id
        NotificationCenter.default.addObserver(self, selector: #selector(reloadButtonState), name: .refreshButtonState, object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self, name: .refreshButtonState, object: nil)
    }
   @objc func reloadButtonState() {
       insertButtonType()
    }
    func saveToCore() {
        let uiimage = UIImageView()
        ImageManager.shared.downloadOrGetCache(url: detailData?.posterPath, for: uiimage)
        
        let saved = SavedEntity(originalTitle: detailData?.originalTitle, imdbID: detailData?.imdbID, posterImage: uiimage.image, genre: detailData?.genres?.first?.name, date: detailData?.releaseDate, language: detailData?.originalLanguage, overview: detailData?.overview, id: detailData?.id)
        interactor.handleCreateDelete(type: .create(saved))
       
    }
    func deleteFromCore() {
        guard let id = detailData?.id else {return}
        interactor.handleCreateDelete(type: .deleteSelected(id))
    }
    func insertButtonType() {
        guard let id = detailData?.id else {return}
        interactor.fetchDataFromCore(id: id) { result in
            switch result {
            case .success(let success):
                let moviesWithMatchingID = success.filter { $0.id == id }

                if !moviesWithMatchingID.isEmpty {
                    self.view?.saveButtonFill()
                    return
                } else {
                    self.view?.saveButtonUnFill()
                }
                
               
            case .failure(let failure):
                print(failure)
            }
        }
        
    }

    func viewDidload() {
        fetchDetail()
        
    }
    func fetchDetail() {
        
        interactor.getDetailsWithID(self.id)
            .receive(on: DispatchQueue.main)
            .sink { compl in
                switch compl {
                case .finished:
                    break
                case .failure(let error):
                    Self.logger.error("Could not fetch data: \(error.localizedDescription)")
                   
                }
            } receiveValue: { [weak self] networkResponse in
                guard let self = self else {return}
             
                self.detailData = networkResponse
                view?.setDetail(data: detailData!)
                insertButtonType()
               
            }
            .store(in: &cancellables)

    }
    func openURL() {
        
        router.openURL(urlString: detailData?.imdbID)
    }
   
}
