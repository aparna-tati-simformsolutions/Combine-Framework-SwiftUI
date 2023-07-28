//
//  ContentView.swift
//  CombineFramework
//
//  Created by Aparna Tati on 05/07/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isNavigateToAuthentication = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if self.isNavigateToAuthentication {
                    AsyncView()
                } else {
                    Rectangle()
                        .background(.black)
                    Image(systemName: "square.2.stack.3d.bottom.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 200)
                        .foregroundColor(.white)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isNavigateToAuthentication = true
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
