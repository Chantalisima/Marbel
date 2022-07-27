//
//  ApiEnvironment.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 25/7/22.
//

import Foundation

struct APIEnvironment {
    public static let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "APIBaseURL") as? String ?? ""
}
