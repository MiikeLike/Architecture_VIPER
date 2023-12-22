//
//  ListOfMoviesPresenter.swift
//  Architecture_VIPER
//
//  Created by Mikel Valle on 21/12/23.
//

import Foundation

//MARK: DELEGATION PATTERN
protocol ListOfMoviesUI: AnyObject {
    func update(movies: [MovieViewModel])
}

class ListOfMoviesPresenter {
    var view: ListOfMoviesUI?
    private let listOfMoviesInteractor: ListOfMoviesInteractor
    var viewModels: [MovieViewModel] = []
    
    init(listOfMoviesInteractor: ListOfMoviesInteractor) {
        self.listOfMoviesInteractor = listOfMoviesInteractor
    }
    
    func onViewAppear() {
        Task{
            do {
               let models = try await listOfMoviesInteractor.getListOfMovies().results
                 viewModels = models.map { entity in
                    MovieViewModel(title: entity.title,
                                   overView: entity.overview,
                                   imageURL: entity.imageURL)
                }
                view?.update(movies: viewModels)
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
