//
//  Volunteer.swift
//  Projet Mobile
//
//  Created by etud on 24/03/2023.
//

import Foundation
import SwiftUI


class VolunteerVM: ObservableObject, Identifiable {
    @Published var id: Int
    @Published var email: String
    @Published var nom: String
    @Published var prenom: String
    @Published var isAdmin: Bool

    init(email: String, nom: String, prenom: String, id: Int, isAdmin: Bool) {
        self.email = email
        self.nom = nom
        self.prenom = prenom
        self.id = id
        self.isAdmin = isAdmin
    }
    
    init(volunteer: VolunteerVM) {
        self.email = volunteer.email
        self.nom = volunteer.nom
        self.prenom = volunteer.prenom
        self.id = volunteer.id
        self.isAdmin = volunteer.isAdmin
    }

    init(volunteerDTO: VolunteerDTO) {
        self.email = volunteerDTO.email
        self.nom = volunteerDTO.nom
        self.prenom = volunteerDTO.prenom
        self.id = volunteerDTO.id
        self.isAdmin = volunteerDTO.isAdmin
    }

    func isEmailValid() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        debugPrint("email valid: ", emailPred.evaluate(with: self.email))
        return emailPred.evaluate(with: self.email)
    }

    func isAdminUser() -> Bool {
        return self.isAdmin == true
    }

    func copy() -> VolunteerVM {
        return VolunteerVM(email: self.email, nom: self.nom, prenom: self.prenom, id: self.id, isAdmin: self.isAdmin)
    }
}
