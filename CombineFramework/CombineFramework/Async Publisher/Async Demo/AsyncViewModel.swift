//
//  AsyncViewModel.swift
//  CombineFramework
//
//  Created by Aparna Tati on 28/07/23.
//

import Foundation
import Combine

class AsyncViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    let asyncManager = AsyncManager()
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        Task {
            for await value in asyncManager.$myData.values {
                DispatchQueue.main.async {
                    self.dataArray = value
                }
            }
        }
    }
    
    func start() async {
        await asyncManager.addData()
    }
}
