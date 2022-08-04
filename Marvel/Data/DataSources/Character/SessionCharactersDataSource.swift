//
//  SessionCharactersDataSource.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 27/7/22.
//

import Foundation

class SessionCharactersDataSource: SessionCharactersDataSourceProtocol {
   
    var characters: [Character]?
    
    // MARK: - Singleton
    
    static let shared = SessionCharactersDataSource()
    
    // MARK: - Private Init
    
    private init() {}
    
    // MARK: - SessionProductsDataSource functions
}
