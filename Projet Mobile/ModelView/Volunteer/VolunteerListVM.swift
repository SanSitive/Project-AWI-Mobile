//
//  VolunteerListVM.swift
//  Projet Mobile
//
//  Created by etud on 27/03/2023.
//

import Foundation

class VolunteerListViewModel: ObservableObject {
    @Published private(set) var volunteers: [VolunteerVM] = []
    private let dao = VolunteerDAO()
    
    func process(intent: VolunteerIntent) async {
        switch intent {
        case .create(let volunteer):
            do {
                let id = try await dao.createVolunteer(volunteer: volunteer.volunteerDTO)
                let id = try await dao.createVolunteer(volunteer: <#T##VolunteerVM#>, completion: <#T##(Result<Int, Error>) -> Void#>)
                volunteer.id = id
                volunteers.append(volunteer)
            } catch {
                // Handle error
            }
        case .update(let volunteer):
            do {
                let success = try await dao.update(volunteer: volunteer.volunteerDTO)
                if success {
                    if let index = volunteers.firstIndex(where: { $0.id == volunteer.id }) {
                        volunteers[index] = volunteer
                    }
                }
            } catch {
                // Handle error
            }
        case .delete(let id):
            do {
                let success = try await dao.delete(id: id)
                if success {
                    volunteers.removeAll { $0.id == id }
                }
            } catch {
                // Handle error
            }
        }
    }
}
