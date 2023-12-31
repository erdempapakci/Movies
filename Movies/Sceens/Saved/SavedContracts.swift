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
    func deleteCell(at index: Int)
}
protocol SavedViewInteractorProtocol: BaseInteractorProtocol {
    func fetchDataFromCore(comp: @escaping(Result<[MoviesMain], Error>) -> Void)
    func handleCoreData(type: CoreCRUD)

}
protocol SavedViewControllerProtocol: BaseViewProtocol {
    func reloadData()

}
