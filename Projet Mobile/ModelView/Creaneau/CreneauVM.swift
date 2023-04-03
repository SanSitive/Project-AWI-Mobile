//
//  CreneauVM.swift
//  Projet Mobile
//
//  Created by etud on 27/03/2023.
//

import Foundation
import SwiftUI

class CreneauVM: ObservableObject, Identifiable {
    @Published var id: Int
    @Published var id_jour: Int
    @Published var heureDebut: Int
    @Published var heureFin: Int
    @Published var minuteDebut: Int
    @Published var minuteFin: Int

    init(id: Int, id_jour: Int, heureDebut: Int, heureFin: Int, minuteDebut: Int, minuteFin: Int) {
        self.id = id
        self.id_jour = id_jour
        self.heureDebut = heureDebut
        self.heureFin = heureFin
        self.minuteDebut = minuteDebut
        self.minuteFin = minuteFin
    }

    init(creneauDTO: CreneauDTO) {
        self.id = creneauDTO.id
        self.id_jour = creneauDTO.id_jour
        self.heureDebut = creneauDTO.heureDebut
        self.heureFin = creneauDTO.heureFin
        self.minuteDebut = creneauDTO.minuteDebut
        self.minuteFin = creneauDTO.minuteFin
    }

    func copy() -> CreneauVM {
        return CreneauVM(id: self.id, id_jour: self.id_jour, heureDebut: self.heureDebut, heureFin: self.heureFin, minuteDebut: self.minuteDebut, minuteFin: self.minuteFin)
    }
}
