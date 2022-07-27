//
//  Error.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 26/7/22.
//

import Foundation

enum APIError: Error, LocalizedError {
    case jsonConversionFailure(String)
    case messageError(String)
    case badRequest
    case unauthorized
    case requestFailed(String)
}

extension APIError {
    var errorDescription: String? {
        switch self {
        case .jsonConversionFailure(let description):
            return "JSON Conversion Failure -> \(description)"
        case .badRequest, .unauthorized:
            return nil
        case .requestFailed(let description):
            return description
        case .messageError(let message):
            return message
        }
    }
}
