//
//  DetailInteractor.swift
//  Architecture_VIPER
//
//  Created by Mikel Valle on 28/12/23.
//

import Foundation

protocol DetailInteractable: AnyObject {
    func getDetailMovie(with id: String) async throws -> DetailMovieEntity
}

class DetailInteractor {
    // Constantes para la URL base y la clave de la API
    private let baseURL = "https://api.themoviedb.org/3/movie/"
    private let apiKey = "44f387c88393699f2b01c8d6b0713e4d"

    func getDetailMovie(with id: String) async throws -> DetailMovieEntity {
        // Crear la URL utilizando URLComponents para una construcción más segura
        guard var urlComponents = URLComponents(string: baseURL + id) else {
            // Manejar el caso donde no se puede construir la URL correctamente
            throw APIError.networkError(NSError(domain: NSCocoaErrorDomain, code: NSURLErrorBadURL))
        }
        
        // Agregar el parámetro de la clave de la API a la URL
        urlComponents.queryItems = [URLQueryItem(name: "api_key", value: apiKey)]

        // Obtener la URL final después de agregar el parámetro de la clave de la API
        guard let url = urlComponents.url else {
            // Manejar el caso donde no se puede obtener la URL final
            throw APIError.networkError(NSError(domain: NSCocoaErrorDomain, code: NSURLErrorBadURL))
        }

        do {
            // Realizar la solicitud de red de manera asíncrona
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Decodificar los datos JSON utilizando JSONDecoder
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            return try jsonDecoder.decode(DetailMovieEntity.self, from: data)
        } catch {
            // Manejar errores durante la solicitud de red o la decodificación
            print("Error durante la solicitud de la API o decodificación: \(error)")
            throw APIError.decodingError(error)
        }
    }
}
