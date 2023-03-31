//
//  CreneauListVM.swift
//  Projet Mobile
//
//  Created by Lexay on 31/03/2023.
//

import Foundation
import SwiftUI

class CreneauListVM: ObservableObject {
    @Published var creneaux: [CreneauVM] = []

    func appendCreneau(_ creneau: CreneauVM) {
        creneaux.append(creneau)
    }

    func updateCreneau(_ updatedCreneau: CreneauVM) {
        if let index = creneaux.firstIndex(where: { $0.id == updatedCreneau.id }) {
            creneaux[index] = updatedCreneau
        }
    }

    func removeCreneau(withId id: Int) {
        if let index = creneaux.firstIndex(where: { $0.id == id }) {
            creneaux.remove(at: index)
        }
    }
}

