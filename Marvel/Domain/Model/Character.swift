//
//  Character.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 26/7/22.
//

import Foundation

struct Character: Decodable {
    let id: Int?
    let name: String?
    let description: String?
//    let modified: String?
//    let resourceURL: String?
//    let urls: [URLtype]?
//    let thumbnail: Thumbnail?
//    let comics: [Comic]
//    let stories: [Storie]
}
//
//struct URLtype: Decodable {
//    let type: String?
//    let url: String?
//}
//
//struct Thumbnail: Decodable {
//    let path: String?
//    let extensionpath: String?
//    
//    enum CodingKeys: String, CodingKey {
//        case extensionpath = "extension"
//        case path
//    }
//}
//
//struct Comic: Decodable {
//    let available: Int?
//    let returned: Int?
//    let collectionURI: String?
//    let items: [ComicSummary]?
//}
//
//struct ComicSummary: Decodable {
//    let resourceURI: String?
//    let name: String?
//}
//
//struct Storie: Decodable {
//    let available: Int?
//    let returned: Int?
//    let collectionURI: String?
//    let items: [StorieSummary]?
//}
//
//struct StorieSummary: Decodable {
//    let resourceURI: String?
//    let name: String?
//    let type: String?
//}
//
