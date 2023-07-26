//
//  NumberListViewModel.swift
//  CombineFramework
//
//  Created by Aparna Tati on 26/07/23.
//

import Foundation
import Combine

class NumberListViewModel: ObservableObject {
    @Published var numbers: [Int] = []
    private var timer: AnyCancellable?
    
    init() {
        let scheduler = DispatchQueue(label: "scheduler")
        let timerPublisher = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .receive(on: scheduler)
        
        timer = timerPublisher
            .map { _ in
                Int.random(in: 1...100)
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] number in
                self?.numbers.append(number)
            }
    }
}
