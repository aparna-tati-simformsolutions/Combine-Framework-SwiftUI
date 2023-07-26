//
//  PostViewMode.swift
//  CombineFramework
//
//  Created by Aparna Tati on 26/07/23.
//

import Foundation
import Combine

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    private var cancellables = Set<AnyCancellable>()
    private let operationQueue = OperationQueue()
    
    func getPosts() {
        let apiURL1 = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let apiURL2 = URL(string: "https://jsonplaceholder.typicode.com/posts?userId=2")!
        
        let publisher1 = Future<[Post], Error> { promise in
            PostManager.shared.fetchPosts(from: apiURL1) { result in
                switch result {
                case .success(let posts):
                    promise(.success(posts))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
        .subscribe(on: operationQueue)
        .eraseToAnyPublisher()
        
        let publisher2 = Future<[Post], Error> { promise in
            PostManager.shared.fetchPosts(from: apiURL1) { result in
                switch result {
                case .success(let posts):
                    promise(.success(posts))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
        .subscribe(on: operationQueue)
        .eraseToAnyPublisher()
        
        Publishers.Merge(publisher1, publisher2)
            .collect()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { [weak self] postsArray in
                let posts = postsArray.flatMap { $0 }
                self?.posts = posts
            })
            .store(in: &cancellables)
    }
}
