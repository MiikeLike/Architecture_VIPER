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
        let interactor = ListOfMoviesInteractor()
        let presenter = ListOfMoviesPresenter(listOfMoviesInteractor: interactor)
        let view = ListOfMoviesView(presenter: presenter)
        presenter.view = view
        //view.presenter = presenter
        
        
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
