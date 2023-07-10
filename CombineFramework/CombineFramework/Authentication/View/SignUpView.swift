//
//  SignUpView.swift
//  CombineFramework
//
//  Created by Aparna Tati on 10/07/23.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject private var signUpViewModel = SignUpViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            Form {
                Section {
                    TextField("Name", text: $signUpViewModel.userName)
                        .autocorrectionDisabled(true)
                        .keyboardType(.asciiCapable)
                    TextField("Email", text: $signUpViewModel.userEmail)
                        .autocorrectionDisabled(true)
                        .keyboardType(.emailAddress)
                    SecureField("Password", text: $signUpViewModel.userPassword)
                    SecureField("Comfirm Password", text: $signUpViewModel.userConfirmPassword)
                }
                Button("Sign Up") {
                    signUpViewModel.signUp()
                }
                .padding(10)
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .foregroundColor(.white)
                .opacity(buttonOpacity)
                .disabled(signUpViewModel.isFormValid)
                .cornerRadius(10)
            }
        }
    }
    
    var buttonOpacity: Double {
        return signUpViewModel.isFormValid ? 1.0 : 0.5
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
