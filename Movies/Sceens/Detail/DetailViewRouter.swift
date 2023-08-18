//
//  DetailViewRouter.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

final class DetailViewRouter: DetailViewRouterProtocol{
    func openURL(urlString: String?) {
        if let id = urlString,   let url = URL(string: "https://www.imdb.com/title/\(id)"){
           
            UIApplication.shared.open(url)
        }
    }
    
    
}
