//
//  FestivalDAO.swift
//  Projet Mobile
//
//  Created by etud on 21/03/2023.
//

import Foundation

class FestivalDAO {
  private let url = "https://festiland-api.cluster-ig4.igpolytech.fr/festivals"
  
  func getAll(token: String, completion: @escaping(Result<[FestivalVM]?, Error>) -> Void) async -> Void {
    var request = URLRequest(url: URL(string: self.url)!)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-type")
//    request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    
    let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
      guard let data = data, error == nil else {
        return completion(.failure(error!))
      }
      print(String(data: data, encoding: .utf8)!)
      Task {
        do {
          let decoded : [FestivalDTO]? = await JSONHelper.decode(data: data)
//          print(decoded)
          if let decoded = decoded {
            let festivals = FestivalDTO.festivalDTO2Festival(data: decoded)
            completion(.success(festivals))
          } else {
            //completion(.failure())
          }
        }
      }
    }
    dataTask.resume()
  }
}
