//
//  DetailRouter.swift
//  Architecture_VIPER
//
//  Created by Mikel Valle on 28/12/23.
//

import Foundation
import UIKit

class DetailRouter {
    func showDetail(fromViewController: UIViewController, withMovieId movieId: String) {
        let interactor = DetailInteractor()
            let presenter = DetailPresenter(movieId: movieId,
                                            interactor: interactor,
                                            mapper: MapperDetailMovieViewModel())
            let view = DetailView(presenter: presenter)
            presenter.ui = view

        fromViewController.present(view, animated: true)
    }
}
