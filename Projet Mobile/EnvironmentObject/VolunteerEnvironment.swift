//
//  VolunteerEnvironment.swift
//  Projet Mobile
//
//  Created by etud on 28/03/2023.
//

import Foundation

class VolunteerEnvironment: ObservableObject {
    @Published var state: VolunteerState = .idle
    private let dao = VolunteerDAO()
    
    var volunteers: [VolunteerVM] {
        switch state {
        case .loaded(let volunteers):
            return volunteers
        default:
            return []
        }
    }

    func process(intent: VolunteerIntent) {
        switch intent {
        case .fetch:
            state = .loading
            dao.fetchVolunteers { result in
                switch result {
                case .success(let fetchedVolunteers):
                    DispatchQueue.main.async {
                        self.state = .loaded(fetchedVolunteers)
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.state = .error(error)
                    }
                }
            }
        case .create(let volunteer):
            dao.createVolunteer(volunteer: volunteer) { result in
                switch result {
                case .success(let id):
                    DispatchQueue.main.async {
                        volunteer.id = id
                        if case .loaded(var volunteers) = self.state {
                            volunteers.append(volunteer)
                            self.state = .loaded(volunteers)
                        }
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.state = .error(error)
                    }
                }
            }
        case .update(let volunteer):
            dao.updateVolunteer(volunteer: volunteer) { result in
                switch result {
                case .success(let success):
                    if success {
                        DispatchQueue.main.async {
                            if case .loaded(var volunteers) = self.state {
                                if let index = volunteers.firstIndex(where: { $0.id == volunteer.id }) {
                                    volunteers[index] = volunteer
                                    self.state = .loaded(volunteers)
                                }
                            }
                        }
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.state = .error(error)
                    }
                }
            }
        case .delete(let id):
            dao.deleteVolunteer(id: id) { result in
                switch result {
                case .success(let success):
                    if success {
                        DispatchQueue.main.async {
                            if case .loaded(var volunteers) = self.state {
                                volunteers.removeAll { $0.id == id }
                                self.state = .loaded(volunteers)
                            }
                        }
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.state = .error(error)
                    }
                }
            }
        }
    }
}

