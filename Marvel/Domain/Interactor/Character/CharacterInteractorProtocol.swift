//
//  SplashInteractor.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 25/7/22.
//

import Foundation

protocol CharacterInteractorProtocol where Self: BaseInteractor {
    
    func getCharacters() async throws -> [Character]
}
