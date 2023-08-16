//
//  MainContracts.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation
import Combine
import UIKit

typealias ViewStateBlock = (ViewState) -> Void
enum ViewState {
    case loading
    case newData
    case moreData
    case noData
    case failure(Error)
    case finished
 
    
}
protocol MainPresenterDelegate: AnyObject {
    func handleState(state: ViewState)
}
protocol MainViewProtocol: BaseViewProtocol {
    func setTitle()
    func reloadData()
    func showIndicator()
    func hideIndicator()
}
protocol MainPresenterProtocol: BasePresenterProtocol {
    
    
    func count() -> Int
    func cellForRowAt(index: Int) -> MovieEntity
    func searchData(query: String)
    func isLoadingCell(index: Int) -> Bool
   
    func routeToDetail(id: String)
    func didSelectItem(_ index: Int) -> String
}

extension MainPresenterProtocol {
    func isLoadingCell(index: Int) -> Bool {
        return true
    }
    
}
protocol MainInteractorProtocol: BaseInteractorProtocol {
    func getListOfQuery(query: String) -> AnyPublisher<MovieResponse, Error>
}
protocol MainRouterProtocol: BaseRouterProtocol {
    func routeToDetail(id: String)
    var view: UIViewController? { get set }
}
