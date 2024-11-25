//
//  ResultView.swift
//  QuizWhiz
//
//  Created by Paul Dionisio on 11/22/24.
//

import SwiftUI

struct ResultView: View {
    var score: Int
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Your score")
                        .font(.title)
                        .foregroundColor(.green)
                        .bold()
                    Text("\(score)/5")
                        .font(.title)
                        .foregroundColor(.black)
                        .bold()
                    
                    NavigationLink{
                        QuizView()
                    } label: {
                        Text(LocalizedStringKey("AGAIN"))
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .frame(maxWidth: .infinity, maxHeight: 60)
                            .foregroundColor(Color.white)
                            .background(.green)
                            .cornerRadius(10)
                    }
                    .background(.orange)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                }
                .padding()
            }
        }
        .padding(20)
    }
}

#Preview {
    NavigationStack{
        ResultView(score: 0)
    }
}
