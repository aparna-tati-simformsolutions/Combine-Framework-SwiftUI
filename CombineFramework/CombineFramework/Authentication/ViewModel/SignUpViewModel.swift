//
//  SignUpViewModel.swift
//  CombineFramework
//
//  Created by Aparna Tati on 10/07/23.
//

import Foundation
import Combine

class SignUpViewModel: ObservableObject {
    // MARK: - Variables
    @Published var userName = ""
    @Published var userEmail = ""
    @Published var userPassword = ""
    @Published var userConfirmPassword = ""
    @Published var isFormValid = false
    private var publishers = Set<AnyCancellable>()
}

extension SignUpViewModel {
    var isUserNameValidPublisher: AnyPublisher<Bool, Never> {
        $userName
            .map { name in
                return name.count >= 3
            }
            .eraseToAnyPublisher()
    }
    
    var isEmailValidPublisher: AnyPublisher<Bool, Never> {
        $userEmail
            .map { email in
                let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
                return emailPredicate.evaluate(with: email)
            }
            .eraseToAnyPublisher()
    }
    
    var isPasswordValidPublisher: AnyPublisher<Bool, Never> {
        $userPassword
            .map { password in
                return password.count >= 8
            }
            .eraseToAnyPublisher()
    }
    
    var isConfirmPasswordValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest($userPassword, $userConfirmPassword)
            .map { password, confirmPassword in
                return password == confirmPassword
            }
            .eraseToAnyPublisher()
    }
    
    var isSignUpFormValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest4(
            isUserNameValidPublisher,
            isEmailValidPublisher,
            isPasswordValidPublisher,
            isConfirmPasswordValidPublisher
        )
        .map { isUserNameValid, isEmailValid, isPasswordValid, isConfirmPasswordValid in
            return isUserNameValid && isEmailValid && isPasswordValid && isConfirmPasswordValid
        }
        .eraseToAnyPublisher()
    }
    
    func signUp() {
        isSignUpFormValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isFormValid, on: self)
            .store(in: &publishers)
        if userEmail == "Ap123@gmail.com" && userPassword == "123456789" {
            print("User Logged in succesfully")
        }
    }
}
