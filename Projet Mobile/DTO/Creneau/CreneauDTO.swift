//
//  CreneauDTO.swift
//  Projet Mobile
//
//  Created by etud on 27/03/2023.
//

import Foundation

struct CreneauDTO : Codable{
    var id : Int
    var id_jour : Int
    var heureDebut : Int
    var heureFin : Int
    var minuteDebut : Int
    var minuteFin : Int
    
    init(creneau: CreneauVM) {
        self.id = creneau.id
        self.id_jour = creneau.id_jour
        self.heureDebut = creneau.heureDebut
        self.heureFin = creneau.heureFin
        self.minuteDebut = creneau.minuteDebut
        self.minuteFin = creneau.minuteFin
    }

    init(id: Int, id_jour: Int, heureDebut: Int, heureFin: Int, minuteDebut: Int, minuteFin: Int) {
        self.id = id
        self.id_jour = id_jour
        self.heureDebut = heureDebut
        self.heureFin = heureFin
        self.minuteDebut = minuteDebut
        self.minuteFin = minuteFin
    }

    func toModel() -> CreneauVM {
        return CreneauVM(creneau: self)
    }

    static func fromModel(_ model: CreneauVM) -> CreneauDTO {
        return CreneauDTO(creneau: model)
    }
}
