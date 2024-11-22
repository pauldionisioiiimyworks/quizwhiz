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
        Text("Your score")
        .font(.headline)
        Text("\(score)/5")
        .font(.subheadline)
        
        NavigationLink{
            QuizView()
        } label: {
            Text("Home")
                .foregroundStyle(.black)
                .padding()
        }
        .background(.orange)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
    }
}

#Preview {
    NavigationStack{
        ResultView(score: 0)
    }
}
