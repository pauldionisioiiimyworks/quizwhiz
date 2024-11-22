//
//  LoginViewModel.swift
//  QuizWhiz
//
//  Created by Paul Dionisio on 11/22/24.
//

import Foundation

class LoginViewModel: ObservableObject {

    @Published var username: String = ""
    @Published var password: String = ""

    func login() {
        LoginService(
            parameters: LoginRequest(
                username: username,
                password: password
            )
        ).call { _ in
            // Login successful, navigate to the Home screen
            print("Login successful")
        }
    }
}
