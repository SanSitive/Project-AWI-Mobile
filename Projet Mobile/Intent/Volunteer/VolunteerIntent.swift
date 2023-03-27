//
//  VolunteerIntent.swift
//  Projet Mobile
//
//  Created by Lexay on 27/03/2023.
//
import Foundation

enum VolunteerIntent {
    case create(VolunteerVM, VolunteerListVM)
    case update(VolunteerVM, VolunteerListVM)
    case delete(Int, VolunteerListVM)
    
    func process() {
        switch self {
        case .create(let volunteer, let volunteerListVM):
            let dao = VolunteerDAO()
            dao.createVolunteer(volunteer: volunteer) { result in
                switch result {
                case .success(let id):
                    DispatchQueue.main.async {
                        volunteer.id = id
                        volunteerListVM.appendVolunteer(volunteer)
                    }
                case .failure(let error):
                    print("Error creating volunteer: \(error)")
                }
            }
        case .update(let volunteer, let volunteerListVM):
            let dao = VolunteerDAO()
            dao.updateVolunteer(volunteer: volunteer) { result in
                switch result {
                case .success(let success):
                    if success {
                        DispatchQueue.main.async {
                            volunteerListVM.updateVolunteer(volunteer)
                        }
                    }
                case .failure(let error):
                    print("Error updating volunteer: \(error)")
                }
            }
        case .delete(let id, let volunteerListVM):
            let dao = VolunteerDAO()
            dao.deleteVolunteer(id: id) { result in
                switch result {
                case .success(let success):
                    if success {
                        DispatchQueue.main.async {
                            volunteerListVM.removeVolunteer(withId: id)
                        }
                    }
                case .failure(let error):
                    print("Error deleting volunteer: \(error)")
                }
            }
        }
    }
}
