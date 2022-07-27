//
//  DataSource.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 26/7/22.
//

import Foundation

protocol AsyncApiDataSource {
            
    func execute<T: Decodable>(type: T.Type, _ request: URLRequest) async throws -> T
    
}


extension AsyncApiDataSource {
    
    
    func execute<T: Decodable>(type: T.Type, _ request: URLRequest) async throws -> T {
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.requestFailed("unvalid response")
        }
        
        switch httpResponse.statusCode {
        case 200..<300:
            print("OK")
            do {
                let decoder = JSONDecoder()
                return try decoder.decode(type, from: data)
            } catch (let error) {
                throw APIError.jsonConversionFailure(error.localizedDescription)
            }
        case 401:
            throw APIError.unauthorized
        case 400..<500:
            print("Bad Request")
            do {
                let decoder = JSONDecoder()
                let decodedObject = try decoder.decode(DescriptionResponse.self, from: data)
                throw APIError.messageError(decodedObject.description)
            } catch (let error) {
                throw APIError.jsonConversionFailure(error.localizedDescription)
            }
        case 500..<1000:
            print("Server Error")
            throw APIError.messageError("Server Error")
        default:
            throw APIError.messageError("Server Error")
        }
    
    }
}

