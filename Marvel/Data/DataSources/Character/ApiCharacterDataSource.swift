//
//  ApiSplashDataSource.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 27/7/22.
//

import Foundation

class ApiCharacterDataSource: AsyncApiDataSource, ApiCharacterDataSourceProtocol {
    

    // MARK: - Singleton
    
    static let shared = ApiCharacterDataSource()
    
    // MARK: - Private Init
    
    private init() {}
    
    // MARK: - Functions
    
    func characters() async throws -> Characters {
        let urlRequest = CharactersRequest.all.urlRequest()
        return try await execute(type: Characters.self, urlRequest)
    }
    
    func characterById(id: Int) async throws -> Characters {
        let urlRequest = CharactersRequest.specific(id).urlRequest()
        return try await execute(type: Characters.self, urlRequest)
    }
    
    func comics(for id: Int) async throws -> Comics {
        let urlRequest = ComicRequest.comics(userId: id).urlRequest()
        return try await execute(type: Comics.self, urlRequest)
    }
}
