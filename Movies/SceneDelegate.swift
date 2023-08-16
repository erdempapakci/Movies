//
//  SceneDelegate.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = TabBarBuilder.build()
           window?.makeKeyAndVisible()
        window?.windowScene = windowScene
        
    }


}


