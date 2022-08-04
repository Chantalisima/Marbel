//
//  Comic.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 2/8/22.
//

import Foundation

struct Comic: Decodable {
    let id: Int
    let title: String
    let imagepath: String?
}

extension Comic {

    enum ComicKeys: String, CodingKey {
        case id
        case title
        case thumbnail
        case extensionpath = "extension"
        case path
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ComicKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        let thumbnailContainer = try container.nestedContainer(keyedBy: ComicKeys.self, forKey: .thumbnail)
        let extpath = try thumbnailContainer.decode(String.self, forKey: .extensionpath)
        let path = try thumbnailContainer.decode(String.self, forKey: .path)
        self.imagepath = path + "." + extpath
    }
}
