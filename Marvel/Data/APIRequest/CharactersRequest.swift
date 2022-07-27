//
//  CharactersRequest.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 26/7/22.
//

import Foundation

enum CharactersRequest {
    case all
}

extension CharactersRequest: RequestProtocol {
    
    public var path: String {
        return "/v1/public/characters"
    }
    
    public var method: HTTPMethod {
         .get
    }
    
    public var body: Encodable? {
        return nil
    }

}
