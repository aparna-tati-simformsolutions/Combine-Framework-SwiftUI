//
//  NumberListView.swift
//  CombineFramework
//
//  Created by Aparna Tati on 26/07/23.
//

import SwiftUI

struct NumberListView: View {
    
    @ObservedObject private var viewModel = NumberListViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            List(viewModel.numbers, id: \.self) { number in
                Text("\(number)")
            }
        }
    }
}

struct NumberListView_Previews: PreviewProvider {
    static var previews: some View {
        NumberListView()
    }
}
