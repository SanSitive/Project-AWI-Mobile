//
//  LoginPageView.swift
//  Projet Mobile
//
//  Created by Lexay on 22/03/2023.
//

import SwiftUI

import SwiftUI

struct SignInPageView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var connectedVolunteer: ConnectedVolunteer

    private var authIntent: AuthIntent {
        AuthIntent(connectedVolunteer: connectedVolunteer)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("First name", text: $firstName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Last name", text: $lastName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Email", text: $email)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)

                SecureField("Password", text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: {
                    authIntent.perform(action: .signup(firstName: firstName, lastName: lastName, email: email, password: password, isAdmin: false))
                }) {
                    Text("S'inscrire")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                Spacer()

                HStack {
                    Text("Déjà inscrit ?")
                    NavigationLink(destination: LoginPageView().environmentObject(connectedVolunteer)) {
                        Text("Se connecter")
                            .foregroundColor(.blue)
                    }
                }
                .padding(.bottom)
            }
            .padding()
            .navigationTitle("S'inscrire")
        }
    }
}

struct SignInPageView_Previews: PreviewProvider {
    static var previews: some View {
        SignInPageView()
            .environmentObject(ConnectedVolunteer())
    }
}
