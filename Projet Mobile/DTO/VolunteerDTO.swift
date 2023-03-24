//
//  VolunteerDTO.swift
//  Projet Mobile
//
//  Created by etud on 16/03/2023.
//

import Foundation

struct VolunteerDTO: Codable {
    let id: Int
    let prenom: String
    let nom: String
    let email: String
    let isAdmin: Bool
    
    init(volunteer: VolunteerVM) {
        self.id = volunteer.id
        self.nom = volunteer.nom
        self.prenom = volunteer.prenom
        self.email = volunteer.email
        self.isAdmin = volunteer.isAdmin
    }
    
    init(id: Int, nom: String, prenom: String, email: String, isAdmin: Bool) {
        self.id = id
        self.nom = nom
        self.prenom = prenom
        self.email = email
        self.isAdmin = isAdmin
    }

    func toModel() -> VolunteerVM {
        return VolunteerVM(email: email, nom: nom, prenom: prenom, id: id, isAdmin: isAdmin)
    }
    
    static func fromModel(_ model: VolunteerVM) -> VolunteerDTO {
        return VolunteerDTO(id: model.id, nom: model.nom, prenom: model.prenom, email: model.email, isAdmin: model.isAdmin)
    }
}

/*
struct VolunteerDTO : /*Decodable*/Codable {
    
    var id : Int
    var prenom : String
    var nom : String
    var email : String
    var password: String
    
    
    init(id : Int, prenom : String, nom : String, email : String, password: String) {
        self.id = id
        self.prenom = prenom
        self.nom = nom
        self.email = email
        self.password = password
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "volunteer_id"
        case nom = "volunteer_nom"
        case prenom = "volunteer_prenom"
        case mail = "volunteer_mail"
        case role = "volunteer_role"
        case password = "volunteer_password"
    }
    
//    func decoding(){
//        let decoder = JSONDecoder() // création d'un décodeur
//        if let decoded = try? decoder.decode([VolunteerDTO].self, from:
//        data) { // si on a réussit à décoder self.tracks = decoded
//        }
//    }
    
//    func callAPI(url : String){
//        let trueURL = URL(string: url)!
//        let task = URLSession.shared.dataTask(with: trueURL) { data, response, error in
//            if let data = data {
//                print("data received")
//                print(data)
//
//                //Decoding data
//                let decoder = JSONDecoder() // création d'un décodeur
//                if let decoded = try? decoder.decode(VolunteerDTO.self, from:
//                data) { // si on a réussit à décoder self.tracks = decoded
//                    print(decoded.id)
//                    print(decoded.prenom)
//                    print(decoded.nom)
//                    print(decoded.email)
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
//
//    static func main(){
//        let v = VolunteerDTO(id: 1, prenom: "Maxime", nom: "Stefani", email: "maxime@gmail.com" )
//        v.callAPI(url: "https://festiland-api.cluster-ig4.igpolytech.fr/volunteers/54")
//    }
    
}*/
