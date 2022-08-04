//
//  Character.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 26/7/22.
//

import Foundation

struct Character: Decodable {
    let id: Int?
    let name: String
    let description: String?
    let path: String?
    
    
    enum CharacterCodingKeys: String, CodingKey {
        case id
        case name
        case description
        case thumbnail
        case path
        case extensionpath = "extension"
        case comics
        case items
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CharacterCodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        let nestedContainer = try container.nestedContainer(keyedBy: CharacterCodingKeys.self, forKey: .thumbnail)
        let extensionpath = try nestedContainer.decode(String.self, forKey: .extensionpath)
        let path = try nestedContainer.decode(String.self, forKey: .path)
        self.path = path + "." + extensionpath
    }
}

