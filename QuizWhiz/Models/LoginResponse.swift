//
//  LoginResponse.swift
//  QuizWhiz
//
//  Created by Paul Dionisio on 11/22/24.
//

import Foundation

struct LoginResponse: Decodable {
    let data: LoginResponseData
}

struct LoginResponseData: Decodable {
    let accessToken: String
    let refreshToken: String
}
