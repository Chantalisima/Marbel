//
//  SplashInteractor.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 25/7/22.
//

import Foundation

protocol SplashInteractorProtocol where Self: BaseInteractor {
    
    func getCharacters() async throws -> Characters
}
