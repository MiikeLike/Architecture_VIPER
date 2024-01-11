//
//  DetailPresenter.swift
//  Architecture_VIPER
//
//  Created by Mikel Valle on 28/12/23.
//

import Foundation

protocol DetailPresenterUI: AnyObject {
    func updateUI(viewModel: DetailMovieViewModel)
}

class DetailPresenter {
    weak var ui: DetailPresenterUI?
    private let movieId: String
    private let interactor: DetailInteractable
    private let mapper: MapperDetailMovieViewModel
    
    init(movieId: String,
         interactor: DetailInteractable,
         mapper: MapperDetailMovieViewModel) {
        self.movieId = movieId
        self.interactor = interactor
        self.mapper = mapper
    }
    
    func onViewAppear() {
        Task {
            do {
                 let model = try await interactor.getDetailMovie(with: movieId)
                let viewModel = mapper.map(entity: model)
                await MainActor.run {
                    self.ui?.updateUI(viewModel:viewModel)
                    print(viewModel)
                }
                } catch {
                    print("Error DetailPresenter: \(error)")
            }
        }
    }
}

