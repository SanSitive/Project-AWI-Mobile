//
//  VolunteerDTO.swift
//  Projet Mobile
//
//  Created by etud on 16/03/2023.
//

import Foundation

class VolunteerDTO : Decodable{
    
    var id : Int
    var prenom : String
    var nom : String
    var email : String
    
    
    init(id : Int, prenom : String, nom : String, email : String){
        self.id = id
        self.prenom = prenom
        self.nom = nom
        self.email = email
    }
    
//    func decoding(){
//        let decoder = JSONDecoder() // création d'un décodeur
//        if let decoded = try? decoder.decode([VolunteerDTO].self, from:
//        data) { // si on a réussit à décoder self.tracks = decoded
//        }
//    }
    
    func callAPI(url : String){
        let trueURL = URL(string: url)!
        let task = URLSession.shared.dataTask(with: trueURL) { data, response, error in
            if let data = data {
                print("data received")
                print(data)
                
                //Decoding data
                let decoder = JSONDecoder() // création d'un décodeur
                if let decoded = try? decoder.decode(VolunteerDTO.self, from:
                data) { // si on a réussit à décoder self.tracks = decoded
                    print(decoded.id)
                    print(decoded.prenom)
                    print(decoded.nom)
                    print(decoded.email)
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
            
            if let response = response {
                print("response be like")
                print(response)
            }
            
        }
        task.resume()
    }
    
    static func main(){
        let v = VolunteerDTO(id: 1, prenom: "Maxime", nom: "Stefani", email: "maxime@gmail.com" )
        v.callAPI(url: "https://festiland-api.cluster-ig4.igpolytech.fr/benevoles/54")
    }
    
}
