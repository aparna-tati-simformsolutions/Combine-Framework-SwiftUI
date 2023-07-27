//
//  TimerSubscription.swift
//  CombineFramework
//
//  Created by Aparna Tati on 27/07/23.
//

import Foundation
import Combine

class TimeSubscription<S: Subscriber>: Subscription where S.Input == Date {
    
    private var subscriber: S?
    private let interval: TimeInterval
    private var timer: Timer?
    
    init(subscriber: S, interval: TimeInterval) {
        self.subscriber = subscriber
        self.interval = interval
        self.timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] _ in
            self?.sendTime()
        }
    }
    
    func request(_ demand: Subscribers.Demand) {
        //
    }
    
    func cancel() {
        subscriber = nil
        timer?.invalidate()
        timer = nil
    }
    
    func sendTime() {
        let currentTime = Date()
        _ = subscriber?.receive(currentTime)
    }
}
