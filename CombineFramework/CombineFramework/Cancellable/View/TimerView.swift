//
//  TimerView.swift
//  CombineFramework
//
//  Created by Aparna Tati on 26/07/23.
//

import SwiftUI

struct TimerView: View {
    @ObservedObject private var viewModel = TimerViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Count: \(viewModel.count)")
            Button("Start Timer") {
                viewModel.startCounting()
            }
            Button("Stop Timer") {
                viewModel.stopCounting()
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
