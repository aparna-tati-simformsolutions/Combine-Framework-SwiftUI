//
//  PostManager.swift
//  CombineFramework
//
//  Created by Aparna Tati on 26/07/23.
//

import Foundation

class PostManager {
    static let shared = PostManager()
    
    func fetchPosts(from url: URL, completion: @escaping (Result<[Post], Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    completion(.success(posts))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
