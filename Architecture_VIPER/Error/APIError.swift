//
//  APIError.swift
//  Architecture_VIPER
//
//  Created by Mikel Valle on 28/12/23.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case decodingError(Error)
    
    var description: String {
        switch self {
        case .invalidURL:
            return "La URL de la API es inválida."
        case .networkError(let underlyingError):
            return "Error de red: \(underlyingError.localizedDescription)"
        case .invalidResponse:
            return "La respuesta de la API es inválida."
        case .decodingError(let underlyingError):
            return "Error al decodificar la respuesta: \(underlyingError.localizedDescription)"
        }
    }
}
