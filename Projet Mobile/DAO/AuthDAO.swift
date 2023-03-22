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
  
    static public func tryConnect(email: String, pwd: String, completion: @escaping(Result<AuthDTO?,Error>) -> Void) async -> Void {
        let jsonString = "{ \"email\": \"\(email)\", \"password\": \"\(pwd)\" }"
        guard let jsonData = jsonString.data(using: .utf8) else {return }
        
        var request = URLRequest(url: URL(string: self.authUrl.absoluteString+"/authMobile/signinMobile")!)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        
        /*let dataTask*/_ = URLSession.shared.uploadTask(with: request, from: jsonData) { (data, response, error) in
          guard let data = data, error == nil else {
            return completion(.failure(error!))
          }
          print(String(data: data, encoding: .utf8)!)
          Task {
            do {

              let decoded : AuthDTO? = await JSONHelper.decode(data: data)
              if let decoded = decoded {
                completion(.success(decoded))
              } else {
                //completion(.failure())
              }
            }
          }
        }
    }
}
