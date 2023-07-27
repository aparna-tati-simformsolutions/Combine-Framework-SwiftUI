//
//  UserListView.swift
//  CombineFramework
//
//  Created by Aparna Tati on 27/07/23.
//

import SwiftUI
import Combine

struct UserListView: View {
    @State private var users: [UserModel] = []
    private let userDataPublisher = UserDataPublisher(url: URL(string: "https://jsonplaceholder.typicode.com/users")!)
    @State private var userDataSubscription: AnyCancellable?
    
    var body: some View {
        List(users, id: \.id) { user in
            VStack(alignment: .leading) {
                Text("Name: \(user.name)")
                Text("Email: \(user.email)")
            }
        }
        .onAppear {
            userDataSubscription = userDataPublisher
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        print("Finished")
                    case .failure(let error):
                        print("Failed and error is: \(error.localizedDescription)")
                    }
                }, receiveValue: { users in
                    self.users = users
                })
        }
        .onDisappear {
            userDataSubscription?.cancel()
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
