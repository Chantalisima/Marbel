//
//  Comics.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 3/8/22.
//

import Foundation

struct Comics: Decodable {
    let data: [Comic]
}

extension Comics {
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    enum DataKeys: String, CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        let dataContainer = try values.nestedContainer(keyedBy: DataKeys.self, forKey: .data)
        
        self.data = try dataContainer.decode([Comic].self, forKey: .results)
        print(self.data)
    }
    
}
