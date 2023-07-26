//
//  TimerViewModel.swift
//  CombineFramework
//
//  Created by Aparna Tati on 26/07/23.
//

import Combine
import Foundation

class TimerViewModel: ObservableObject {
    @Published var count = 0
    private var cancellable: AnyCancellable?
    
    func startCounting() {
        cancellable = Timer.publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .sink { [weak self] _ in
                self?.count += 1
            }
    }
    
    func stopCounting() {
        cancellable?.cancel()
    }
}
