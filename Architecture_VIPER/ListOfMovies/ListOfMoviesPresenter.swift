//
//  ListOfMoviesPresenter.swift
//  Architecture_VIPER
//
//  Created by Mikel Valle on 21/12/23.
//

import Foundation

protocol ListOfMoviesPresentable: AnyObject {
    var view: ListOfMoviesUI? { get }
    var viewModels: [MovieViewModel] { get }
    func onViewAppear()
}

//MARK: DELEGATION PATTERN
protocol ListOfMoviesUI: AnyObject {
    func update(movies: [MovieViewModel])
}

class ListOfMoviesPresenter: ListOfMoviesPresentable {
   weak var view: ListOfMoviesUI?
    private let listOfMoviesInteractor: ListOfMoviesInteractor
    var viewModels: [MovieViewModel] = []
    private let mapper: Mapper
    
    init(listOfMoviesInteractor: ListOfMoviesInteractor, mapper: Mapper = Mapper()) {
        self.listOfMoviesInteractor = listOfMoviesInteractor
        self.mapper = mapper
    }
    
    func onViewAppear() {
        Task {
            do {
                let models = try await listOfMoviesInteractor.getListOfMovies().results
                let mappedViewModels = models.map { mapper.map(entity: $0) }
                viewModels = mappedViewModels
                view?.update(movies: viewModels)
            } catch {
                print("Error: \(error)")
            }
        }
    }

}

