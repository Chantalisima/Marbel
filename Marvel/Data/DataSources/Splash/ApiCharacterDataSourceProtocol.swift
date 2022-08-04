//
//  ApiSplashDataSourceProtocol.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 27/7/22.
//

import Foundation

protocol ApiSplashDataSourceProtocol {
    func characters() async throws -> Characters
}
