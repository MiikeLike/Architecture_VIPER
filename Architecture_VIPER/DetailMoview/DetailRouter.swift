//
//  DetailRouter.swift
//  Architecture_VIPER
//
//  Created by Mikel Valle on 28/12/23.
//

import Foundation

class DetailRouter {
    func showDetail(withMovieId movieId : String) {
        let interactor = DetailInteractor()
        let presenter = DetailPresenter(movieId: movieId,
                                        interactor: interactor as! DetailInteractable,
                                        mapper: MapperDetailMovieViewModel())
        let view = DetailView(presenter: presenter)
        presenter.ui = view
    }
}
