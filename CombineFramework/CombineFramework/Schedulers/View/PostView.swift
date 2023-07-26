//
//  PostView.swift
//  CombineFramework
//
//  Created by Aparna Tati on 26/07/23.
//

import SwiftUI

struct PostView: View {
    
    @ObservedObject private var viewModel = PostViewModel()
    
    var body: some View {
        List(viewModel.posts) { post in
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.headline)
                Text("Id: \(post.id)")
                    .font(.subheadline)
            }
            .padding()
        }
        .onAppear {
            viewModel.getPosts()
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
