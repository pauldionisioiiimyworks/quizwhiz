//
//  LoginView.swift
//  QuizWhiz
//
//  Created by Paul Dionisio on 11/22/24.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    @State var isLogin = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                VStack {
                    Image("quizwhiz-logo-ng")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(.green)
                    .clipShape(Circle())
                    TextField(
                        LocalizedStringKey("Login.UsernameField.Title"),
                        text: $viewModel.username
                    )
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(.top, 20)
                    .font(.headline)
                    .foregroundStyle(.green)
                    .fontDesign(.rounded)
                    
                    Divider()
                    
                    SecureField(
                        LocalizedStringKey("Login.PasswordField.Title"),
                        text: $viewModel.password
                    )
                    .padding(.top, 20)
                    .font(.headline)
                    .foregroundStyle(.green)
                    .fontDesign(.rounded)
                    
                    Divider()
                }
                
                Spacer()
                
                Button(action: {
                    
                    Auth.auth().signIn(withEmail: viewModel.username, password: viewModel.password) { authResult, error in
                        
                        if error != nil {
                            return
                        }
                        
                        print("Hello \(String(describing: authResult?.user.uid))")
                        
                        isLogin = true
                    }
                    
                }) {
                    Text(LocalizedStringKey("Login.LoginButton.Title"))
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .foregroundColor(Color.white)
                        .background(.green)
                        .cornerRadius(10)
                }
                .navigationDestination(isPresented: $isLogin) {
                    QuizView().navigationBarHidden(true)
                }
                
                NavigationLink {
                    SignupView().navigationBarHidden(false)
                } label: {
                    Label("Signup", systemImage: "")
                        .font(.headline)
                    .foregroundColor(.green)
                }
            }
            .padding(30)
        }
        .accentColor(.green)
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
