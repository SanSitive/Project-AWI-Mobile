//
//  ConnectionView.swift
//  Projet Mobile
//
//  Created by etud on 21/03/2023.
//

import SwiftUI

struct ConnectionView: View {
    
    @State var email: String = ""
    @State var mdp: String = ""
    
    var body: some View {
        VStack(){
            Spacer()
            VStack(alignment: .center){
                TextField("Email_placeholder", text: $email)
                TextField("MDP_placeholder", text: $mdp)
                Button("Se connecter"){
                    let result = AuthDAO.tryConnect(email: email, pwd: mdp, completion: <#T##(Result<AuthDTO?, Error>) -> Void#>)
                }
            }
            Spacer()
        }
        
    }
}

struct ConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionView()
    }
}
