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
    func onTapCell(atIndex: Int)
}

//MARK: DELEGATION PATTERN
protocol ListOfMoviesUI: AnyObject {
    func update(movies: [MovieViewModel])
}

class ListOfMoviesPresenter: ListOfMoviesPresentable {
    
   weak var view: ListOfMoviesUI?
    private let listOfMoviesInteractor: ListOfMoviesInteractor
    var viewModels: [MovieViewModel] = []
    private var models: [PopularMovieEntitiy] = []
    private let mapper: Mapper
    private let router: ListOfMoviesRouting
    
    init(listOfMoviesInteractor: ListOfMoviesInteractor, 
         mapper: Mapper = Mapper(),
         router:ListOfMoviesRouting) {
        self.listOfMoviesInteractor = listOfMoviesInteractor
        self.mapper = mapper
        self.router = router
    }
    
    func onViewAppear() {
        Task {
            do {
                models = try await listOfMoviesInteractor.getListOfMovies().results
                let mappedViewModels = models.map { mapper.map(entity: $0) }
                viewModels = mappedViewModels
                view?.update(movies: viewModels)
            } catch {
                print("Error: \(error)")
            }
        }
    }
    func onTapCell(atIndex: Int) {
        let movieId = models[atIndex].id
        router.showDetailMovie(withMovieId: movieId.description)
    }
}

