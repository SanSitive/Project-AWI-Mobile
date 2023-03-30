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
        return emailPred.evaluate(with: self.email)
    }

    func isAdminUser() -> Bool {
        return self.isAdmin == true
    }

    func copy() -> VolunteerVM {
        return VolunteerVM(email: self.email, nom: self.nom, prenom: self.prenom, id: self.id, isAdmin: self.isAdmin)
    }
}

/*
protocol VolunteerObserver {
    func change(nom: String)
    func change(prenom: String)
    func change(email: String)
    func change(isAdmin: Bool)
}

class VolunteerVM : ObservableObject, Identifiable {
    
    var observer: VolunteerObserver?
    @Published var id: Int
    
    @Published var email: String {
        didSet {
            emailChanged(to: email)
        }
    }
    
    @Published var nom: String {
        didSet {
            nameChanged(to: nom)
        }
    }
    
    @Published var prenom: String {
        didSet {
            surnameChanged(to: prenom)
        }
    }
    
    @Published var isAdmin: Bool {
        didSet {
            if isAdmin != oldValue {
                self.observer?.change(isAdmin: self.isAdmin)
            }
        }
    }
    
    init(email: String, nom: String, prenom: String, id: Int, isAdmin: Bool) {
        self.email = email
        self.nom = nom
        self.prenom = prenom
        self.id = id
        self.isAdmin = isAdmin
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
        return emailPred.evaluate(with: self.email)
    }
    
    func isAdminUser() -> Bool {
        return self.isAdmin == true
    }
    
    func copy() -> VolunteerVM {
        return VolunteerVM(email: self.email, nom: self.nom, prenom: self.prenom, id: self.id, isAdmin: self.isAdmin)
    }
    
    func paste(volunteer: VolunteerVM) {
        self.email = volunteer.email
        self.nom = volunteer.nom
        self.prenom = volunteer.prenom
        self.id = volunteer.id
        self.isAdmin = volunteer.isAdmin
    }

    private func emailChanged(to newEmail: String) {
        if isEmailValid() {
            observer?.change(email: newEmail)
        } else {
            // Handle invalid email case
        }
    }
    
    private func nameChanged(to newName: String) {
        if !newName.isEmpty {
            observer?.change(nom: newName)
        } else {
//            nom = oldValue
        }
    }
    
    private func surnameChanged(to newSurname: String) {
        if !newSurname.isEmpty {
            observer?.change(prenom: newSurname)
        } else {
//            prenom = oldValue
        }
    }
}*/


/*

class VolunteerVM : ObservableObject, Identifiable {
    
    var observer: VolunteerObserver?
    @Published var id: Int
    
    @Published var email: String {
        didSet {
            if email != oldValue {
                if isEmailValid() {
                    self.observer?.change(email: self.email)
                } else {
                    self.email = oldValue
                }
            }
        }
    }
    
    @Published var nom: String {
        didSet {
            if nom != oldValue {
                if nom.count >= 1 {
                    self.observer?.change(nom: self.nom)
                } else {
                    self.nom = oldValue
                }
            }
        }
    }
    
    @Published var prenom: String {
        didSet {
            if prenom != oldValue {
                if prenom.count >= 1 {
                    self.observer?.change(prenom: self.prenom)
                } else {
                    self.prenom = oldValue
                }
            }
        }
    }
    
    
    @Published var isAdmin: Bool {
        didSet {
            if isAdmin != oldValue {
                self.observer?.change(isAdmin: self.isAdmin)
            }
        }
    }
    
    init(email: String, nom: String, prenom: String, id: Int, isAdmin: Bool) {
        self.email = email
        self.nom = nom
        self.prenom = prenom
        self.id = id
        self.isAdmin = isAdmin
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
        return emailPred.evaluate(with: self.email)
    }
    
    func isAdminUser() -> Bool {
        return self.isAdmin == true
    }
    
    func copy() -> VolunteerVM {
        return VolunteerVM(email: self.email, nom: self.nom, prenom: self.prenom, id: self.id, isAdmin: self.isAdmin)
    }
    
    func paste(volunteer: VolunteerVM) {
        self.email = volunteer.email
        self.nom = volunteer.nom
        self.prenom = volunteer.prenom
        self.id = volunteer.id
        self.isAdmin = volunteer.isAdmin
    }
}*/
