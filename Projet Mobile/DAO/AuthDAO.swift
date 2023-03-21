//
//  AuthDAO.swift
//  Projet Mobile
//
//  Created by etud on 21/03/2023.
//

import Foundation


struct AuthDTO : Codable {
    var id: Int
    var prenom: String
    var nom: String
    var email: String
    var isAdmin: Bool
}

class AuthDAO{
  private static let authUrl = URL(string: "https://festiland-api.cluster-ig4.igpolytech.fr/")!
  
  static public func tryConnect(email: String, pwd: String) async -> AuthDTO {
    let jsonString = "{ \"email\": \"\(email)\", \"password\": \"\(pwd)\" }"
    guard let jsonData = jsonString.data(using: .utf8) else {return }
    
    var request = URLRequest(url: URL(string: self.authUrl.absoluteString+"/authMobile/signinMobile")!)
    request.httpMethod = "POST"
    request.httpBody = jsonData
    request.setValue("application/json", forHTTPHeaderField: "Content-type")
    //    request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    
      var authDto : AuthDTO
    do{
      let (data, _) = try await URLSession.shared.upload  (for: request, from: jsonData)
      //let dataString = String(data: data, encoding: .utf8)!
      guard let decoded : AuthDTO = await JSONHelper.decode(data: data) else {print("Erreur lors du decode de l'authentification"); return ""}
      
      authDto = decoded
      
    }catch{
      print("Erreur lors de la connexion")
      print(error)
    }
    return authDto
  }
}
