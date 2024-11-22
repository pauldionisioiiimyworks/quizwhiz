//
//  LoginRequest.swift
//  QuizWhiz
//
//  Created by Paul Dionisio on 11/22/24.
//

import Foundation

struct LoginRequest: Encodable {
    let username: String
    let password: String
}
