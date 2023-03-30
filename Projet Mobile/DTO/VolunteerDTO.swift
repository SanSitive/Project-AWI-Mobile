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
    let password: String?
    
    init(volunteer: VolunteerVM, password: String? = nil) {
        self.id = volunteer.id
        self.nom = volunteer.nom
        self.prenom = volunteer.prenom
        self.email = volunteer.email
        self.isAdmin = volunteer.isAdmin
        self.password = password
    }
    
    init(id: Int, nom: String, prenom: String, email: String, isAdmin: Bool, password: String? = nil) {
        self.id = id
        self.nom = nom
        self.prenom = prenom
        self.email = email
        self.isAdmin = isAdmin
        self.password = password
    }

    func toModel() -> VolunteerVM {
        return VolunteerVM(email: email, nom: nom, prenom: prenom, id: id, isAdmin: isAdmin)
    }
    
    static func fromModel(_ model: VolunteerVM, password: String? = nil) -> VolunteerDTO {
        return VolunteerDTO(id: model.id, nom: model.nom, prenom: model.prenom, email: model.email, isAdmin: model.isAdmin, password: password)
    }
}
