//
//  FestivalZoneDTO.swift
//  Projet Mobile
//
//  Created by etud on 28/03/2023.
//

import Foundation

struct FestivalZoneDTO: Codable {
    let id_festivalZone : Int
    let id_festival : Int
    let label_zone : String
    let nbBenevolesNecessaires : Int
    
    
    init(festivalZone: FestivalZoneVM) {
        /*self.id = volunteer.id
        self.nom = volunteer.nom
        self.prenom = volunteer.prenom
        self.email = volunteer.email
        self.isAdmin = volunteer.isAdmin*/
    }

    init(id_festivalZone: Int, id_festival: Int, label_zone: String, nbBenevolesNecessaires: Int) {
        self.id_festivalZone = id_festivalZone
        self.id_festival = id_festival
        self.label_zone = label_zone
        self.nbBenevolesNecessaires = nbBenevolesNecessaires
       
    }

    func toModel() -> FestivalZoneVM {
        return FestivalZoneVM()
    }
    
    static func fromModel(_ model: VolunteerVM) -> VolunteerDTO {
        return VolunteerDTO(id: model.id, nom: model.nom, prenom: model.prenom, email: model.email, isAdmin: model.isAdmin)
    }
}
