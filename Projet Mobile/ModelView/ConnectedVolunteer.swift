//
//  ConnectedVolunteer.swift
//  Projet Mobile
//
//  Created by etud on 31/03/2023.
//

import Combine

class ConnectedVolunteer: ObservableObject {
    @Published var volunteer: VolunteerVM?
    @Published var isAuthenticated = false
}
