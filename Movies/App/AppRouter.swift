//
//  AppRouter.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

final class AppRouter {
    static let shared = AppRouter() 
    var windowScene: UIWindowScene?
    var window: UIWindow?
    
    private init() {}
    
    func configureWindow(windowScene: UIWindowScene) {
        self.windowScene = windowScene
        self.window = UIWindow(windowScene: windowScene)
        
       
        let rootViewController = TabBarBuilder.build()
        window?.rootViewController = rootViewController
        
        window?.makeKeyAndVisible()
    }
}
