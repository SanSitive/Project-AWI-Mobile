//
//  TestAuthView.swift
//  Projet Mobile
//
//  Created by etud on 31/03/2023.
//

import SwiftUI

struct TestAuthView: View {
    @EnvironmentObject var connectedVolunteer: ConnectedVolunteer
    
    private var authIntent: AuthIntent {
        AuthIntent(connectedVolunteer: connectedVolunteer)
    }
    
    var body: some View {
        VStack {
            Button("Login") {
                authIntent.perform(action: .login(username: "laura@gmail.com", password: "test"))
            }
            .padding()
            
            Button("Signup") {
                authIntent.perform(action: .signup(firstName: "John", lastName: "Doe", email: "john@example.com", password: "password", isAdmin: false))
            }
            .padding()
            
            Button("Logout") {
                authIntent.perform(action: .logout)
            }
            .padding()
            
            if connectedVolunteer.isAuthenticated {
                Text("Logged in as: \(connectedVolunteer.volunteer?.prenom ?? "") \(connectedVolunteer.volunteer?.nom ?? "")")
            } else {
                Text("Not logged in")
            }
        }
    }
}

struct TestAuthView_Previews: PreviewProvider {
    static var previews: some View {
        TestAuthView()
            .environmentObject(ConnectedVolunteer())
    }
}
