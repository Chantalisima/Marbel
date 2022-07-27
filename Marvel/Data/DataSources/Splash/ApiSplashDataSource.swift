//
//  ApiSplashDataSource.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 27/7/22.
//

import Foundation

class ApiSplashDataSource: AsyncApiDataSource, ApiSplashDataSourceProtocol {
    

    // MARK: - Singleton
    
    static let shared = ApiSplashDataSource()
    
    // MARK: - Private Init
    
    private init() {}
    
    // MARK: - Functions
    
    func characters() async throws -> Characters {
        let urlRequest = CharactersRequest.all.urlRequest()
        return try await execute(type: Characters.self, urlRequest)
    }
}
