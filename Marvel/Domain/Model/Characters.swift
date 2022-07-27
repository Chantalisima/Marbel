//
//  Characters.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 27/7/22.
//

import Foundation


struct Characters: Decodable {
//    let code: Int?
//    let status: String?
//    let copyright: String?
//    let attributionText: String?
    let data: [Character]
}


extension Characters {
    
    enum CodingKeys: String, CodingKey {
//        case code
//        case status
//        case copyright
//        case attributonText
        case data
    }
    
    enum DataKeys: String, CodingKey {
        case results
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        var dataContainer = try values.nestedContainer(keyedBy: DataKeys.self, forKey: .data)
        
        self.data = try dataContainer.decode([Character].self, forKey: .results)

    }
}
