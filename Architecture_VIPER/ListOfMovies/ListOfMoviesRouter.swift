//
//  ListOfMoviesRouter.swift
//  Architecture_VIPER
//
//  Created by Mikel Valle on 21/12/23.
//

import Foundation
import UIKit

class ListOfMoviesRouter {
    func showListOfMovies(window: UIWindow?) {
        let view = ListOfMoviesView()
        let interactor = ListOfMoviesInteractor()
        let presenter = ListOfMoviesPresenter(listOfMoviesInteractor: interactor)
        presenter.view = view
        view.presenter = presenter
        
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
