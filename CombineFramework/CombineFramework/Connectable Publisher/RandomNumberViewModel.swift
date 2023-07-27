//
//  RandomNumberViewModel.swift
//  CombineFramework
//
//  Created by Aparna Tati on 27/07/23.
//

import Foundation
import Combine

class RandomNumberViewModel: ObservableObject {
    @Published var numbers: [Int] = []
    private let randomNumberPublisher = (1...5).publisher.makeConnectable()
    private var randomNumberSubscription: AnyCancellable?
    
    init() {
        randomNumberSubscription = randomNumberPublisher
            .sink { [weak self] number in
                self?.numbers.append(number)
            }
    }
    
    func startPublishing() {
        _ = randomNumberPublisher.connect()
    }
    
    deinit {
        randomNumberSubscription?.cancel()
    }
}
