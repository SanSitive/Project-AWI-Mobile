//
//  ConnectionView.swift
//  Projet Mobile
//
//  Created by etud on 21/03/2023.
//

import SwiftUI

struct ConnectionView: View {
    
    @State var mdp: String = ""
    @StateObject var authVM: AuthVM = AuthVM(id:0,prenom:"nil",nom:"nil",email:"nil",isAdmin: false)
    
    var body: some View {
        VStack(){
            Spacer()
            VStack(alignment: .center){
                TextField("Email_placeholder", text: $authVM.email)
                TextField("MDP_placeholder", text: $mdp)
                Text("\(authVM.error)")
                NavigationLink(destination: HomePageView()){
                    Button("Se connecter"){
    //                    authVM.login(pwd:mdp){ success in
    //                        if(success){
    //                            //MOVE TO NEXT SCREEN
    //                        }
    //                    }
                    }
                }
                Spacer()
            }
        }
    }
}

struct ConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionView()
    }
}
