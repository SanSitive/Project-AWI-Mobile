//
//  JourDTO.swift
//  Projet Mobile
//
//  Created by etud on 27/03/2023.
//

import Foundation

struct JourDTO : Codable{
      var id : Int
      var id_festival : Int
      var date : Date
      var nom : String
      var heureOuverture : Int
      var heureFermeture : Int
      var minuteOuverture : Int
      var minuteFermeture : Int
    
    
    init(jour: JourVM) {
        self.id = jour.id
        self.id_festival = jour.id_festival
        self.date = jour.date
        self.nom = jour.nom
        self.heureOuverture = jour.heureOuverture
        self.heureFermeture = jour.heureFermeture
        self.minuteOuverture = jour.minuteOuverture
        self.minuteFermeture = jour.minuteFermeture
    }

    init(id: Int, nom: String, id_festival: Int, date: Date, heureOuverture: Int, heureFermeture: Int, minuteOuverture: Int, minuteFermeture: Int) {
        self.id = id
        self.id_festival = id_festival
        self.date = date
        self.nom = nom
        self.heureOuverture = heureOuverture
        self.heureFermeture = heureFermeture
        self.minuteOuverture = minuteOuverture
        self.minuteFermeture = minuteFermeture
    }

    func toModel() -> JourVM {
        return JourVM(jour: self)
    }

    static func fromModel(_ model: JourVM) -> JourDTO {
        return JourDTO(jour: model)
    }
    
    
}

struct ResponseJour: Decodable{
    var result : [JourDTO]
}
