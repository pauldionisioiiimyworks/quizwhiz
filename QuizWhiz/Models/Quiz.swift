//
//  Quiz.swift
//  QuizWhiz
//
//  Created by Paul Dionisio on 11/22/24.
//

import Foundation

struct Quiz: Codable, Hashable{
    var quizId: Int
    var title: String
    var question: String
    var choices: [Choice]
    var correctAnswer: Int
}

struct Choice: Codable, Hashable{
    var choiceId: Int
    var choiceDesc: String
}
