//
//  TimerViewDemo.swift
//  CombineFramework
//
//  Created by Aparna Tati on 27/07/23.
//

import SwiftUI
import Combine

struct TimerViewDemo: View {
    @State private var currentTime: Date = Date()
    @State private var timeSubscription: AnyCancellable?
    private let timePublisher = TimerPublisher(timeInterval: 1)
    
    var body: some View {
        VStack {
            Text("Current Time:")
            Text("\(formattedTime)")
                .font(.title)
                .padding()
        }
        .onAppear {
            timeSubscription = timePublisher
                .sink { time in
                    currentTime = time
                }
        }
        .onDisappear {
            timeSubscription?.cancel()
        }
    }
    
    private var formattedTime: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter.string(from: currentTime)
    }
}

struct TimerViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        TimerViewDemo()
    }
}
