//
//  PostViewModel.swift
//  CombineFramework
//
//  Created by Aparna Tati on 25/07/23.
//

import Combine
import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [UserResponse] = []
    private var cancellables = Set<AnyCancellable>()
    
    func getUsersList() {
        getUsers().receive(on: DispatchQueue.main).sink { completion in
            switch completion {
            case .finished:
                print("Finished")
            case .failure(let error):
                print("Failed with \(error.localizedDescription)")
            }
        } receiveValue: { user in
            self.users = user.data
        }
        .store(in: &cancellables)
    }
    
    private func getUsers() -> Future<User, Error> {
        return Future { promise in
            guard let apiURL = URL(string: "https://reqres.in/api/users?page=2") else { return }
            URLSession.shared.dataTask(with: apiURL) { data, response, error in
                if let error = error {
                    promise(.failure(error))
                    return
                }
                
                guard let data = data else {
                    promise(.failure(NSError(domain: "com.example.error", code: 1, userInfo: nil)))
                    return
                }
            
                do {
                    let response = try JSONDecoder().decode(User.self, from: data)
                    promise(.success(response))
                } catch {
                    promise(.failure(error))
                }
            }.resume()
        }
    }
}
