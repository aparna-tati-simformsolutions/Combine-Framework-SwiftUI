//
//  Quote.swift
//  CombineFramework
//
//  Created by Aparna Tati on 28/07/23.
//

import Foundation

struct Quote: Codable {
    let id: String
    let author, content, authorSlug, dateAdded, dateModified: String
    let length: Int
    let tags: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case author, content, authorSlug, dateAdded, dateModified, tags, length
    }
}
