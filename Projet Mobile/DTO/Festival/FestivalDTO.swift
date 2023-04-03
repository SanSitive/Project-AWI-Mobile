//
//  FestivalDTO.swift
//  Projet Mobile
//
//  Created by etud on 23/03/2023.
//

import Foundation

struct FestivalDTO : Codable{
    var id : Int
    var nom : String
    var annee : Int
    var isActive : Bool
    
    init(festival: FestivalVM) {
        self.id = festival.id
        self.nom = festival.nom
        self.annee = festival.annee
        self.isActive = festival.isActive
    }

    init(id: Int, nom: String, annee: Int, isActive: Bool) {
        self.id = id
        self.nom = nom
        self.annee = annee
        self.isActive = isActive
    }

    func toModel() -> FestivalVM {
        return FestivalVM(festival: self)
    }

    static func fromModel(_ model: FestivalVM) -> FestivalDTO {
        return FestivalDTO(festival: model)
    }
    
    
}

struct ResponseFestival: Decodable{
    var result : [FestivalDTO]
}

struct FestivalNameDTO: Decodable {
    var nom: String
}

