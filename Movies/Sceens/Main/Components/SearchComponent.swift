//
//  SearchComponent.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit
import Combine


final class SearchComponent: BaseSearchController {
   
    var textSearch = PassthroughSubject<String, Never>()
    
    override func prepareViewDidLoad() {
        super.prepareViewDidLoad()
        searchBar.backgroundColor = .white
    }
}
extension SearchComponent: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            
                self.textSearch.send(searchController.searchBar.text ?? "")
         
               
            })

    }
}
