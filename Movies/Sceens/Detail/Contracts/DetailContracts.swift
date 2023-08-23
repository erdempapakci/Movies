//
//  DetailContracts.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation
import Combine
protocol DetailViewProtocol: BaseViewProtocol {
    func setDetail(data: MovieDetail)
    func saveButtonFill()
    func saveButtonUnFill()
}

protocol DetailViewPresenterProtocol: BasePresenterProtocol, LogProvidable {
    func fetchDetail()
    func openURL()
    func saveToCore()
    
}
protocol DetailViewInteractorProtocol: BaseInteractorProtocol {
    func getDetailsWithID(_ id: String) -> AnyPublisher<MovieDetail, Error>
    func handleCreateDelete(type: CoreCRUD)
    func fetchDataFromCore(id: String, comp: @escaping(Result<[MoviesMain], Error>) -> ())
}
protocol DetailViewRouterProtocol: BaseRouterProtocol {
    
    func openURL(urlString: String?)
}
