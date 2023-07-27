//
//  UserDataSubscription.swift
//  CombineFramework
//
//  Created by Aparna Tati on 27/07/23.
//

import Foundation
import Combine

class UserDataSubscription<S: Subscriber>: Subscription where S.Input == [UserModel], S.Failure == Error {
    private var subscriber: S?
    private let url: URL
    private var isLoading = false
    
    init(subscriber: S, url: URL) {
        self.subscriber = subscriber
        self.url = url
    }
    
    func request(_ demand: Subscribers.Demand) {
        guard !isLoading else { return }
        DispatchQueue.global().async {
            self.isLoading = true
            
            do {
                let data = try Data(contentsOf: self.url)
                let users = try JSONDecoder().decode([UserModel].self, from: data)
                _ = self.subscriber?.receive(users)
                self.subscriber?.receive(completion: .finished)
            } catch {
                self.subscriber?.receive(completion: .failure(error as! Never))
            }
            
            self.isLoading = false
        }
    }
    
    func cancel() {
        subscriber = nil
    }
}
