//
//  ApiSplashDataSourceProtocol.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 27/7/22.
//

import Foundation

protocol ApiCharacterDataSourceProtocol {
    func characters() async throws -> Characters
    func characterById(id: Int) async throws -> Characters
    func comics(for id: Int) async throws -> Comics
}
