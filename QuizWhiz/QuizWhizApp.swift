//
//  QuizWhizApp.swift
//  QuizWhiz
//
//  Created by Paul Dionisio on 11/22/24.
//

import SwiftUI

@main
struct QuizWhizApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environment(ModelData())
        }
    }
}
