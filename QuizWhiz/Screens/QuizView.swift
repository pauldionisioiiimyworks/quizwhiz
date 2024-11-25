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
    @State private var selectionId: Int?
    
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
                        .font(.headline)
                        .bold()
                    
                    List(quizList[quizNumber].choices, id: \.self, selection: $selectedAnswer){ choice in
                        Text(choice.choiceDesc)
                            .listRowBackground(selectionId == choice.choiceId
                                               ? Color.yellow.opacity(0.3)
                                                       : Color.clear)
                            .onTapGesture {
                                selectionId = choice.choiceId
                            }
                    }
                    .listStyle(.plain)
                    .frame(maxHeight: 200)
                    Button{
                        guard selectionId != nil else {
                            return
                        }
                        if (selectedAnswer?.choiceId == quizList[quizNumber].correctAnswer){
                            score += 1
                        }
                        quizNumber += 1
                        if quizNumber == quizList.count{
                            quizNumber = quizList.count-1
                            navigateToResult = true
                        }
                        selectionId = nil
                    } label: {
                        Text(LocalizedStringKey("Submit"))
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .frame(maxWidth: .infinity, maxHeight: 60)
                            .foregroundColor(Color.white)
                            .background(.green)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $navigateToResult) {
            ResultView(score: score)
                .navigationBarHidden(true)
        }
        .padding(20)
    }
}

#Preview {
    NavigationStack{
        QuizView()
            .environment(ModelData())
    }
}
