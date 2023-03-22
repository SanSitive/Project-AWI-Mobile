//
//  LoginPageView.swift
//  Projet Mobile
//
//  Created by Lexay on 22/03/2023.
//

import SwiftUI

struct LoginPageView: View {
    @State private var email = ""
    @State private var password = ""
//    @EnvironmentObject var appSettings : MyEnvVariables
    
    var body: some View {
        
        VStack {
            TextField("Email", text: $email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            NavigationLink(destination: HomePageView()) {
                Button("Se connecter"){
                    
                }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            NavigationLink(destination: Text("ResetPasswordView")) {
                Text("Mot de passe oublié ?")
                    .foregroundColor(.blue)
            }
            .padding()

            Spacer()

            HStack {
                Text(appSettings.API_URL)
                Text("Pas encore inscrit ?")
                NavigationLink(destination: SignInPageView()) {
                    Text("S'inscrire")
                        .foregroundColor(.blue)
                }
            }
            .padding(.bottom)
        }
        .padding()
        .navigationTitle("Se connecter")
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginPageView()
        }
    }
}
