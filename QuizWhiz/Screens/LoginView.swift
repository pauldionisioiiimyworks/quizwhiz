//
//  LoginView.swift
//  QuizWhiz
//
//  Created by Paul Dionisio on 11/22/24.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    @State var isLogin = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                VStack {
                    Image("quizwhiz-logo")
                    .frame(width: 200, height: 200)
                    .padding()
                    TextField(
                        LocalizedStringKey("Login.UsernameField.Title"),
                        text: $viewModel.username
                    )
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(.top, 20)
                    .font(.title)
                    .fontDesign(.rounded)
                    
                    Divider()
                    
                    SecureField(
                        LocalizedStringKey("Login.PasswordField.Title"),
                        text: $viewModel.password
                    )
                    .padding(.top, 20)
                    .font(.title)
                    .fontDesign(.rounded)
                    
                    Divider()
                }
                
                Spacer()
                
                Button(action: {
                    isLogin = true //Goes to third view
                }) {
                    Text(LocalizedStringKey("Login.LoginButton.Title"))
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .foregroundColor(Color.white)
                        .background(Color.cyan)
                        .cornerRadius(10)
                }
                .navigationDestination(isPresented: $isLogin) {
                    QuizView().navigationBarHidden(true)
                }
            }
            .padding(30)
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
