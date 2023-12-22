//
//  Mapper.swift
//  Architecture_VIPER
//
//  Created by Mikel Valle on 22/12/23.
//

import Foundation

struct Mapper {
    func map(entity: PopularMovieEntitiy) -> MovieViewModel {
        MovieViewModel(title: entity.title,
                       overView: entity.overview,
                       imageURL: URL(string: "https://image.tmdb.org/t/p/w200" + entity.imageURL))
    }
}
