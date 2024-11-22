//
//  QuizScreen.swift
//  QuizWhiz
//
//  Created by Paul Dionisio on 11/22/24.
//

import SwiftUI

struct QuizView: View {
    @Environment(ModelData.self) private var modelData
    @State private var quizNumber = 0
    @State private var score = 0
    @State private var navigateToResult = false
    @State private var selectedAnswer: Choice?
    var quizList: [Quiz] {
        modelData.quizList
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(quizList[quizNumber].title)\n")
                        .font(.title)
                        .bold()
                    
                    Text("\(quizList[quizNumber].question)")
                    
                    List(quizList[quizNumber].choices, id: \.self, selection: $selectedAnswer){ choice in
                        Text(choice.choiceDesc)
                    }
                    .listStyle(.plain)
                }
                .padding()
            }
            
            Button{
                if (selectedAnswer?.choiceId == quizList[quizNumber].correctAnswer){
                    score += 1
                }
                quizNumber += 1
                if quizNumber == quizList.count{
                    quizNumber = quizList.count-1
                    navigateToResult = true
                }
            } label: {
                Text("Submit")
                    .foregroundStyle(.black)
                    .frame(width: 100)
                    .padding()
                    .background(.orange)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $navigateToResult) {
            ResultView(score: score)
        }
    }
}

#Preview {
    NavigationStack{
        QuizView()
            .environment(ModelData())
    }
}
