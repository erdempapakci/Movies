//
//  SavedContracts.swift
//  Movies
//
//  Created by Erdem on 21.08.2023.
//

import Foundation

protocol SavedPresenterProtocol: BasePresenterProtocol {
    func numberOfRow() -> Int
    func cellForRowAt(at index: Int) -> SavedEntity
    func deleteAll()
}
protocol SavedViewInteractorProtocol: BaseInteractorProtocol {
    func fetchDataFromCore(comp: @escaping(Result<[MoviesMain], Error>) -> ())
    func deleteAllData()
}
protocol SavedViewControllerProtocol: BaseViewProtocol {
    func reloadData()
   
}
