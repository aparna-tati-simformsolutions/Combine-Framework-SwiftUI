//
//  RandomNumberListView.swift
//  CombineFramework
//
//  Created by Aparna Tati on 27/07/23.
//

import SwiftUI

struct RandomNumberListView: View {
    @ObservedObject private var viewModel = RandomNumberViewModel()
    
    var body: some View {
        VStack {
            Text("Random Numbers:")
            ForEach($viewModel.numbers.indices, id: \.self) { number in
                Text("\(number)")
            }
            Button("Start Publishing") {
                viewModel.startPublishing()
            }
        }
    }
}

struct RandomNumberListView_Previews: PreviewProvider {
    static var previews: some View {
        RandomNumberListView()
    }
}
