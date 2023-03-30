//
//  VolunteerIntent.swift
//  Projet Mobile
//
//  Created by Lexay on 27/03/2023.
//
import Foundation

struct VolunteerIntent {
    let dao = VolunteerDAO()
    let viewModel: VolunteerListVM

    enum Action {
        case create(VolunteerVM, password: String)
        case read
        case update(VolunteerVM)
        case delete(Int)
    }

    func perform(action: Action) {
        switch action {
        case .create(let volunteer, let password):
            createVolunteer(volunteer, password: password)
        case .read:
            fetchVolunteers()
        case .update(let volunteer):
            updateVolunteer(volunteer)
        case .delete(let id):
            deleteVolunteer(withId: id)
        }
    }

    private func fetchVolunteers() {
        dao.fetchVolunteers { result in
            switch result {
            case .success(let fetchedVolunteers):
                DispatchQueue.main.async {
                    viewModel.volunteers = fetchedVolunteers
                }
            case .failure(let error):
                print("Error fetching volunteers: \(error)")
            }
        }
    }

    private func createVolunteer(_ volunteer: VolunteerVM, password: String) {
        dao.createVolunteer(volunteer: volunteer, password: password) { result in
            switch result {
            case .success(let id):
                DispatchQueue.main.async {
                    volunteer.id = id
                    viewModel.appendVolunteer(volunteer)
                }
            case .failure(let error):
                print("Error creating volunteer: \(error)")
            }
        }
    }

    private func updateVolunteer(_ volunteer: VolunteerVM) {
        dao.updateVolunteer(volunteer: volunteer) { result in
            switch result {
            case .success(let success):
                if success {
                    DispatchQueue.main.async {
                        viewModel.updateVolunteer(volunteer)
                    }
                }
            case .failure(let error):
                print("Error updating volunteer: \(error)")
            }
        }
    }

    private func deleteVolunteer(withId id: Int) {
        dao.deleteVolunteer(id: id) { result in
            switch result {
            case .success(let success):
                if success {
                    DispatchQueue.main.async {
                        viewModel.removeVolunteer(withId: id)
                    }
                }
            case .failure(let error):
                print("Error deleting volunteer: \(error)")
            }
        }
    }
}
