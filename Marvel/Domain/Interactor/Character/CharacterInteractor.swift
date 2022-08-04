//
//  SplashInteractorProtocol.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 25/7/22.
//

import Foundation

public class CharacterInteractor: BaseInteractor, CharacterInteractorProtocol {
    

    // MARK: - Properties

    private let apiSplashDataSource: ApiSplashDataSourceProtocol
    
    private var sessionCharactersDataSource: SessionCharactersDataSourceProtocol
    
    // MARK: - Init
    
    init(apiSplashDataSource: ApiSplashDataSourceProtocol, sessionCharactersDataSource: SessionCharactersDataSourceProtocol) {
        self.apiSplashDataSource = apiSplashDataSource
        self.sessionCharactersDataSource = sessionCharactersDataSource
    }

    // MARK: - SplashInteractor functions
    
    func getCharacters() async throws -> [Character] {
        
        if let characters = sessionCharactersDataSource.characters {
            return characters
        }
        
        let characters = try await self.apiSplashDataSource.characters()
        
        if !characters.data.isEmpty {
            self.sessionCharactersDataSource.characters = characters.data
        }
                
        return characters.data
    }

}
