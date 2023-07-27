//
//  TimerPublisher.swift
//  CombineFramework
//
//  Created by Aparna Tati on 27/07/23.
//

import Combine
import Foundation

class TimerPublisher: Publisher {
    
    typealias Output = Date
    
    typealias Failure = Never
    
    private let timeInterval: TimeInterval
    
    init(timeInterval: TimeInterval) {
        self.timeInterval = timeInterval
    }
    
    func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, Date == S.Input {
        let subscription = TimeSubscription(subscriber: subscriber, interval: timeInterval)
        subscriber.receive(subscription: subscription)
    }
}
