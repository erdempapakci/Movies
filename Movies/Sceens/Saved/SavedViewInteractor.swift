//
//  SavedViewInteractor.swift
//  Movies
//
//  Created by Erdem on 21.08.2023.
//

import Foundation
import CoreData

final class SavedViewInteractor: SavedViewInteractorProtocol {
    let coreService: MoviesCore

    init(coreService: MoviesCore) {
        self.coreService = coreService
    }
    
    func handleCoreData(type: CoreCRUD){
        
        switch type {
        case .create:
            break
        case .deleteSelected(let id):
            coreService.deleteItem(id: id)
            break
        case .deleteAll:
            coreService.deleteAllBatches()
            break
        }
    }
    
    func fetchDataFromCore(comp: @escaping(Result<[MoviesMain], Error>) -> ()) {
       
        
        coreService.readData(comp: comp)
      
    }
    
}
