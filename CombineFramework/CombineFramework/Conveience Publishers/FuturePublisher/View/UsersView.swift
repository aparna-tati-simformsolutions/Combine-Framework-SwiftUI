//
//  FutureView.swift
//  CombineFramework
//
//  Created by Aparna Tati on 25/07/23.
//

import SwiftUI

struct UsersView: View {
    
    @ObservedObject private var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(userViewModel.users, id: \.id) { user in
                    UsersRowView(user: user)
                }.onAppear {
                    userViewModel.getUsersList()
                }
            }
        }
    }
}

struct FutureView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}

