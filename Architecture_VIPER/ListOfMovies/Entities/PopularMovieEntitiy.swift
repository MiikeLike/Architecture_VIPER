//
//  PopularMovieEntitiy.swift
//  Architecture_VIPER
//
//  Created by Mikel Valle on 21/12/23.
//

import Foundation

struct PopularMovieEntitiy: Decodable {
    var id: Int
    var title: String
    var overview: String
    var imageURL: String
    var votes: Double
    
    enum CodingKeys: String, CodingKey{
        case id, title, overview
        case imageURL = "poster_path"
        case votes = "vote_average"
    }
}
