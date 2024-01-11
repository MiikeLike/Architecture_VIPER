//
//  MapperDetailMovieViewModel.swift
//  Architecture_VIPER
//
//  Created by Mikel Valle on 7/1/24.
//

import Foundation

struct MapperDetailMovieViewModel {
    func map(entity: DetailMovieEntity) -> DetailMovieViewModel {
        .init(title: entity.title,
              overview: entity.overview,
              backdropPath: URL(string: "https://image.tmdb.org/t/p/w200" + entity.backdropPath))
    }
}
