//
//  BaseContracts.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

protocol BaseViewProtocol: AnyObject {
    
}
protocol BasePresenterProtocol: AnyObject {
    
    func viewDidload()
}

protocol BaseRouterProtocol: AnyObject {
    
}

protocol BaseInteractorProtocol: AnyObject {
    
}
protocol BaseBuilderProtocol{
    
    associatedtype T: UIViewController
    static func build() -> T
}
