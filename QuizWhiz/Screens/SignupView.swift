//
//  SignupView.swift
//  QuizWhiz
//
//  Created by Paul Dionisio on 11/22/24.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

struct SignupView: View {
    
    @State var email = ""
    @State var password = ""
    @State var isSignup = false
    
    var body: some View {
        
        HStack {
            Spacer()
            VStack {
                TextField(
                    LocalizedStringKey("Login.UsernameField.Title"),
                    text: $email
                )
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(.top, 20)
                .font(.title)
                .fontDesign(.rounded)
                
                Divider()
                
                SecureField(
                    LocalizedStringKey("Login.PasswordField.Title"),
                    text: $password
                )
                .padding(.top, 20)
                .font(.title)
                .fontDesign(.rounded)
                
                Divider()
                
                Spacer()
                
                Button(action: {                    
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        if error == nil {
                            isSignup = true
                        }
                    }
                }) {
                    Text(LocalizedStringKey("Login.SignupButton.Title"))
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .foregroundColor(Color.white)
                        .background(Color.cyan)
                        .cornerRadius(10)
                }
                .navigationDestination(isPresented: $isSignup) {
                    LoginView().navigationBarHidden(true)
                }
            }
        }
        .padding(30)
    }
}

#Preview {
    SignupView()
}
