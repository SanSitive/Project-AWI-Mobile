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
