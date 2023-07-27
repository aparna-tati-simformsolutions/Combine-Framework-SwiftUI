//
//  UserDataPublisher.swift
//  CombineFramework
//
//  Created by Aparna Tati on 27/07/23.
//

import Foundation
import Combine

class UserDataPublisher: Publisher {
    
    typealias Output = [UserModel]
    
    typealias Failure = Error
    
    private let url: URL

    init(url: URL) {
        self.url = url
    }
    
    func receive<S>(subscriber: S) where S : Subscriber, Error == S.Failure, [UserModel] == S.Input {
        let subscription = UserDataSubscription(subscriber: subscriber, url: url)
        subscriber.receive(subscription: subscription)
    }
}
