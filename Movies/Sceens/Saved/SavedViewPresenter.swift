//
//  SavedViewPresenter.swift
//  Movies
//
//  Created by Erdem on 18.08.2023.
//

import Foundation
import UIKit

final class SavedViewPresenter: SavedPresenterProtocol, LogProvidable {

    var interactor: SavedViewInteractorProtocol
    weak var view: (SavedViewControllerProtocol)?
    var data = [SavedEntity]()

    init(interactor: SavedViewInteractorProtocol, view: SavedViewControllerProtocol) {
        self.interactor = interactor
        self.view = view
        NotificationCenter.default.addObserver(self, selector: #selector(reloadSaved), name: .refreshSaved, object: nil)

    }
    deinit {
        NotificationCenter.default.removeObserver(self, name: .refreshSaved, object: nil)
    }
    @objc private func reloadSaved() {
        viewDidload()
    }
    func viewDidload() {

        interactor.fetchDataFromCore { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let success):

                    let receivedData = success.map({ main in
                        SavedEntity.init(originalTitle: main.title, imdbID: main.imdbID, posterImage: UIImage(data: main.posterImage ?? Data()), genre: main.genre, date: main.date, language: main.language, overview: main.overview, id: Int(main.id))
                     })

                     data = receivedData

                    self.view?.reloadData()

            case .failure(let failure):
              print(failure)
            }
        }
    }

    func numberOfRow() -> Int {

        return data.count
    }
    func cellForRowAt(at index: Int) -> SavedEntity {

        return data[index]
    }
    func deleteAll() {

        interactor.handleCoreData(type: .deleteAll)

        self.view?.reloadData()
    }

    func deleteCell(at index: Int) {

        guard let id = data[index].id else {return}

        defer {
            interactor.handleCoreData(type: .deleteSelected(id))
            self.view?.reloadData()

        }
        guard index >= 0, index < data.count else { return }
        data.remove(at: index)

    }
}
