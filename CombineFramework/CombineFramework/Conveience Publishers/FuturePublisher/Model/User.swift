//
//  Post.swift
//  CombineFramework
//
//  Created by Aparna Tati on 25/07/23.
//

import Foundation

struct User: Codable {
    let page, perPage, total, totalPages: Int
    let data: [UserResponse]

    enum CodingKeys: String, CodingKey {
        case page, total, data
        case perPage = "per_page"
        case totalPages = "total_pages"
    }
}

struct UserResponse: Codable, Identifiable {
    let id: Int
    let email, firstName, lastName, avatar: String
    
    var name: String {
        return "\(firstName) \(lastName)"
    }
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case id, email, avatar
    }
}
