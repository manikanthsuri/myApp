//
//  LoginView.swift
//  myExpense
//
//  Created by Suri Mani kanth on 01/10/23.
//

import SwiftUI


struct LoginView: View {
    
    @State private var mailId: String = ""
    @State private var password: String = ""
    @State private var isValidEmail: Bool = true
    @State private var isEmptyEmail: Bool = true
    @State private var isEmptyPassword: Bool = true
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Mail ID")
            TextField("Mail ID", text: $mailId)
                .textFieldStyle(.roundedBorder)
            if !isEmptyEmail {
                Text("Email address Can't be empty")
                    .foregroundColor(.red)
            }
            if !isValidEmail {
                Text("Invalid email address")
                    .foregroundColor(.red)
            }
            
            Text("Password")
            TextField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            if !isEmptyPassword {
                Text("Password Can't be empty")
                    .foregroundColor(.red)
            }
            
            
            Button("Login") {
                isValidEmail = LoginViewModel.isValidEmail(email: mailId)
                isEmptyPassword = !password.isEmpty
                isEmptyEmail = !mailId.isEmpty
                print(isEmptyPassword)
            }
        }
        .padding(20)
        .toolbar {
            NavigationLink {
                RegistrationView()
            } label: {
                Text("Register")
            }
        }
    }
}
