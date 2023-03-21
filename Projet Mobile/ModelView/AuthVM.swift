//
//  AuthVM.swift
//  Projet Mobile
//
//  Created by etud on 21/03/2023.
//

import Foundation
class AuthVM: ObservableObject{
  
    @Published private var id: Int
    @Published var prenom: String
    @Published var nom: String
    @Published var email: String
    @Published private(set) var isAdmin: Bool
    @Published var error: String
    
    init(id: Int, prenom: String, nom: String, email: String, isAdmin: Bool) {
        self.id = id
        self.prenom = prenom
        self.nom = nom
        self.email = email
        self.isAdmin = isAdmin
        self.error = ""
    }
    
    
    func login(pwd: String, completion: @escaping (Bool) -> Void){
//        showProgressView = true
        Task {
            await AuthDAO.tryConnect(email: email, pwd: pwd){result in
                switch result{
                case .failure(let er):
                    DispatchQueue.main.async {
                        self.error = "mdp not working"
                        completion(false)
                    }
                case .success(let success):
                    DispatchQueue.main.async {
                        self.id = success!.id
                        self.prenom = success!.prenom
                        self.nom = success!.nom
                        self.email = success!.email
                        self.isAdmin = success!.isAdmin
                        completion(true)
                    }
                }
            }
        }
      }
    
}


