//
//  ListOfMoviesInteractor.swift
//  Architecture_VIPER
//
//  Created by Mikel Valle on 21/12/23.
//

import Foundation


protocol ListOfMoviesInteractable: AnyObject {
    func getListOfMovies() async throws -> PopularMovieResponseEntity
}

class ListOfMoviesInteractor: ListOfMoviesInteractable {
    // Modificamos la función para ser asíncrona y lanzar errores
    func getListOfMovies() async throws -> PopularMovieResponseEntity {
        // Utilizamos guard para manejar el caso donde no se puede crear la URL
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=44f387c88393699f2b01c8d6b0713e4d") else {
            throw APIError.networkError(NSError(domain: NSCocoaErrorDomain, code: NSURLErrorBadURL))
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
            throw APIError.decodingError(error)
        }
    }
}




