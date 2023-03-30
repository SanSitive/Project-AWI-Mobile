//
//  VolunteerListVM.swift
//  Projet Mobile
//
//  Created by Lexay on 27/03/2023.
//

import Foundation
import SwiftUI

class VolunteerListVM: ObservableObject {
    @Published var volunteers: [VolunteerVM] = []

    func appendVolunteer(_ volunteer: VolunteerVM) {
        volunteers.append(volunteer)
    }

    func updateVolunteer(_ updatedVolunteer: VolunteerVM) {
        if let index = volunteers.firstIndex(where: { $0.id == updatedVolunteer.id }) {
            volunteers[index] = updatedVolunteer
        }
    }

    func removeVolunteer(withId id: Int) {
        if let index = volunteers.firstIndex(where: { $0.id == id }) {
            volunteers.remove(at: index)
        }
    }
}

/*
class VolunteerListVM: ObservableObject {
    @Published private(set) var volunteers: [VolunteerVM] = []
    private let dao = VolunteerDAO()

    func fetchVolunteers() {
        dao.fetchVolunteers { result in
            switch result {
            case .success(let fetchedVolunteers):
                DispatchQueue.main.async {
                    self.volunteers = fetchedVolunteers
                }
            case .failure(let error):
                print("Error fetching volunteers: \(error)")
            }
        }
    }
    
    func appendVolunteer(_ volunteer: VolunteerVM) {
        self.volunteers.append(volunteer)
    }
    
    func updateVolunteer(_ volunteer: VolunteerVM) {
        if let index = self.volunteers.firstIndex(where: { $0.id == volunteer.id }) {
            self.volunteers[index] = volunteer
        }
    }
    
    func removeVolunteer(withId id: Int) {
        self.volunteers.removeAll { $0.id == id }
    }
}*/



//class VolunteerListVM: ObservableObject {
//    @Published private(set) var volunteers: [VolunteerVM] = []
//    private let dao = VolunteerDAO()
//
//    func fetchVolunteers() {
//        dao.fetchVolunteers { result in
//            switch result {
//            case .success(let fetchedVolunteers):
//                DispatchQueue.main.async {
//                    self.volunteers = fetchedVolunteers
//                }
//            case .failure(let error):
//                print("Error fetching volunteers: \(error)")
//            }
//        }
//    }
//
//    func process(intent: VolunteerIntent) {
//        switch intent {
//        case .create(let volunteer):
//            dao.createVolunteer(volunteer: volunteer) { result in
//                switch result {
//                case .success(let id):
//                    DispatchQueue.main.async {
//                        volunteer.id = id
//                        self.volunteers.append(volunteer)
//                    }
//                case .failure(let error):
//                    print("Error creating volunteer: \(error)")
//                }
//            }
//        case .update(let volunteer):
//            dao.updateVolunteer(volunteer: volunteer) { result in
//                switch result {
//                case .success(let success):
//                    if success {
//                        DispatchQueue.main.async {
//                            if let index = self.volunteers.firstIndex(where: { $0.id == volunteer.id }) {
//                                self.volunteers[index] = volunteer
//                            }
//                        }
//                    }
//                case .failure(let error):
//                    print("Error updating volunteer: \(error)")
//                }
//            }
//        case .delete(let id):
//            dao.deleteVolunteer(id: id) { result in
//                switch result {
//                case .success(let success):
//                    if success {
//                        DispatchQueue.main.async {
//                            self.volunteers.removeAll { $0.id == id }
//                        }
//                    }
//                case .failure(let error):
//                    print("Error deleting volunteer: \(error)")
//                }
//            }
//        }
//    }
//}
