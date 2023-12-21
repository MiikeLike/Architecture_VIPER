//
//  PopularMovieResponseEntity.swift
//  Architecture_VIPER
//
//  Created by Mikel Valle on 21/12/23.
//

import Foundation


struct PopularMovieResponseEntity: Decodable {
    let results: [PopularMovieEntitiy]
}
