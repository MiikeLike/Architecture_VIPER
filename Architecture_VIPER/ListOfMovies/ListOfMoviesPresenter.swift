//
//  ListOfMoviesPresenter.swift
//  Architecture_VIPER
//
//  Created by Mikel Valle on 21/12/23.
//

import Foundation

//MARK: DELEGATION PATTERN
protocol ListOfMoviesUI: AnyObject {
    func update(movies: [PopularMovieEntitiy])
}

class ListOfMoviesPresenter {
    var ui: ListOfMoviesUI?
    private let listOfMoviesInteractor: ListOfMoviesInteractor
    var models: [PopularMovieEntitiy] = []
    
    init(listOfMoviesInteractor: ListOfMoviesInteractor) {
        self.listOfMoviesInteractor = listOfMoviesInteractor
    }
    
    func onViewAppear() {
        Task{
            do {
                models = try await listOfMoviesInteractor.getListOfMovies().results
                self.ui?.update(movies: models)
                
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
