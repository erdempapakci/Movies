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
}

protocol DetailViewPresenterProtocol: BasePresenterProtocol, LogProvidable {
    func fetchDetail()
    func openURL()
    
}
protocol DetailViewInteractorProtocol: BaseInteractorProtocol {
    func getDetailsWithID(_ id: String) -> AnyPublisher<MovieDetail, Error>
}
protocol DetailViewRouterProtocol: BaseRouterProtocol {
    
    func openURL(urlString: String?)
}
