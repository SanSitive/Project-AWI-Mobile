//
//  VolunteerDAO.swift
//  Projet Mobile
//
//  Created by etud on 17/03/2023.
//

import Foundation


struct VolunteerDAO {
    
    static let API_URL : String = "https://festiland-api.cluster-ig4.igpolytech.fr"
    
//    static func findOne(id: Int) -> VolunteerDTO {
//        var volunteerReturned : VolunteerDTO
//
//        let url_request = API_URL + "/benevoles/" + String(id)
//        let URL = URL(string: url_request)!
//        let task = URLSession.shared.dataTask(with: URL) { data, response, error in
//            if let data = data {
//                print("data received")
//                print(data)
//
//                //Decoding data
//                let decoder = JSONDecoder() // création d'un décodeur
//                if let decoded = try? decoder.decode(VolunteerDTO.self, from:
//                                                        data) { // si on a réussit à décoder self.tracks = decoded
//                    print(decoded.id)
//                    print(decoded.prenom)
//                    print(decoded.nom)
//                    print(decoded.email)
//
//                    return VolunteerDTO(id: decoded.id, prenom: decoded.prenom, nom: decoded.nom, email: decoded.email)
//                }
//            } else if let error = error {
//                print("HTTP Request Failed \(error)")
//            }
//
//            if let response = response {
//                print("response be like")
//                print(response)
//            }
//
//        }
//        task.resume()
//    }
    
    
}
