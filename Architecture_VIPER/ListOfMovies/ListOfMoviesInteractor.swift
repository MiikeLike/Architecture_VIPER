//
//  ListOfMoviesInteractor.swift
//  Architecture_VIPER
//
//  Created by Mikel Valle on 21/12/23.
//

import Foundation

class ListOfMoviesInteractor {
    // Definimos un enum para representar los posibles errores del interactor
    enum InteractorError: Error {
        case networkingError
        case decodingError
    }

    // Modificamos la función para ser asíncrona y lanzar errores
    func getListOfMovies() async throws -> PopularMovieResponseEntity {
        // Utilizamos guard para manejar el caso donde no se puede crear la URL
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=") else {
            throw InteractorError.networkingError
        }
        // Usamos await para realizar la solicitud de red de manera asíncrona
        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            // Intentamos decodificar los datos JSON
            let decodedData = try JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
            return decodedData
        } catch {
            // En caso de error de decodificación, lanzamos un error correspondiente
            print("Error \(error)")
            throw InteractorError.decodingError
        }
    }
}



