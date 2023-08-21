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
   
    }
    func saveToCore() {
        let uiimage = UIImageView()
        ImageManager.shared.downloadOrGetCache(url: detailData?.posterPath, for: uiimage)
        
        let saved = SavedEntity(originalTitle: detailData?.originalTitle, imdbID: detailData?.imdbID, posterImage: uiimage.image, genre: detailData?.genres?.first?.name, date: detailData?.releaseDate, language: detailData?.originalLanguage, overview: detailData?.overview)
        interactor.saveDataToCore(data: saved)
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
               
            }
            .store(in: &cancellables)

    }
    func openURL() {
        
        router.openURL(urlString: detailData?.imdbID)
    }
   
}
