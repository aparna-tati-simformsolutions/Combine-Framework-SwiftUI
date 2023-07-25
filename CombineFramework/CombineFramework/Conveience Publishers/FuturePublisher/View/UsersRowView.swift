//
//  UsersRowView.swift
//  CombineFramework
//
//  Created by Aparna Tati on 25/07/23.
//

import SwiftUI

struct UsersRowView: View {
    
    var user: UserResponse
    
    var body: some View {
        HStack(spacing: 5, content: {
            AsyncImage(url: URL(string: user.avatar)) { image in
                image
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading, spacing: 10) {
                Text(user.name)
                    .font(.headline)
                Text(user.email)
            }
        })
    }
}
