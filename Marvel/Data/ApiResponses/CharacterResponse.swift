//
//  Character.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 26/7/22.
//

import Foundation

struct CharacterResponse: Decodable {
    let data: [Character]
    let total: Int
    let offset: Int
    let count: Int
}


extension CharacterResponse {
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    enum DataKeys: String, CodingKey {
        case total
        case offset
        case count
        case results
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        let dataContainer = try values.nestedContainer(keyedBy: DataKeys.self, forKey: .data)
        
        self.data = try dataContainer.decode([Character].self, forKey: .results)
        self.total = try dataContainer.decode(Int.self, forKey: .total)
        self.offset = try dataContainer.decode(Int.self, forKey: .offset)
        self.count = try dataContainer.decode(Int.self, forKey: .count)

        
    }
}

