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
