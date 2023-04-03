//
//  AuthIntent.swift
//  Projet Mobile
//
//  Created by etud on 31/03/2023.
//

import Foundation

struct AuthIntent {
    let dao = AuthDAO()
    let connectedVolunteer: ConnectedVolunteer

    enum Action {
        case login(username: String, password: String)
        case signup(firstName: String, lastName: String, email: String, password: String, isAdmin: Bool)
        case logout
    }

    func perform(action: Action) {
        switch action {
        case .login(let username, let password):
            performLogin(username: username, password: password)
        case .signup(let firstName, let lastName, let email, let password, let isAdmin):
            performSignup(firstName: firstName, lastName: lastName, email: email, password: password, isAdmin: isAdmin)
        case .logout:
            performLogout()
        }
    }

    private func performLogin(username: String, password: String) {
        dao.login(username: username, password: password) { result in
            switch result {
            case .success(let volunteerDTO):
                DispatchQueue.main.async {
                    self.connectedVolunteer.volunteer = volunteerDTO.toModel()
                    self.connectedVolunteer.isAuthenticated = true
                }
            case .failure(let error):
                print("Error logging in: \(error)")
            }
        }
    }
    
    private func performSignup(firstName: String, lastName: String, email: String, password: String, isAdmin: Bool) {
            dao.signup(firstName: firstName, lastName: lastName, email: email, password: password, isAdmin: isAdmin) { result in
                switch result {
                case .success(let volunteerDTO):
                    DispatchQueue.main.async {
                        self.connectedVolunteer.volunteer = volunteerDTO.toModel()
                        self.connectedVolunteer.isAuthenticated = true
                    }
                case .failure(let error):
                    print("Error signing up: \(error)")
                }
            }
        }

    private func performLogout() {
        DispatchQueue.main.async {
            self.connectedVolunteer.volunteer = nil
            self.connectedVolunteer.isAuthenticated = false
        }
    }
}
