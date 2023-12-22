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
                       imageURL: entity.imageURL)
    }
}
