//
//  SceneDelegate.swift
//  Architecture_VIPER
//
//  Created by Mikel Valle on 21/12/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var listOfMovesRouter = ListOfMoviesRouter()


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        listOfMovesRouter.showListOfMovies(window: window)
    }
}

