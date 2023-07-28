//
//  AsyncView.swift
//  CombineFramework
//
//  Created by Aparna Tati on 28/07/23.
//

import SwiftUI

struct AsyncView: View {
    
    @ObservedObject private var viewModel = AsyncViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.dataArray, id: \.self) {
                    Text($0)
                        .font(.headline)
                }
            }
        }
        .task {
            await viewModel.start()
        }
    }
}

struct AsyncView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncView()
    }
}
