//
//  FestivalZoneDTO.swift
//  Projet Mobile
//
//  Created by etud on 28/03/2023.
//

import Foundation
struct FestivalZoneDTO : Codable{
    var id_festivalZone : Int
    var id_festival : Int
    var label_zone : String
    var nbBenevolesNecessaires : Int
    
    
    init(id_festivalZone: Int, id_festival: Int, label_zone: String, nbBenevolesNecessaires: Int){
        self.id_festival = id_festival
        self.id_festivalZone = id_festivalZone
        self.label_zone = label_zone
        self.nbBenevolesNecessaires = nbBenevolesNecessaires
    }
    
    init(festivalZone: FestivalZoneVM){
        self.id_festival = festivalZone.id_festival
        self.id_festivalZone = festivalZone.id_festivalZone
        self.label_zone = festivalZone.label_zone
        self.nbBenevolesNecessaires = festivalZone.nbBenevolesNecessaires
    }
    
    func toModel() -> FestivalZoneVM {
        return FestivalZoneVM(festivalZone: self)
    }

    static func fromModel(_ model: FestivalZoneVM) -> FestivalZoneDTO {
        return FestivalZoneDTO(festivalZone: model)
    }

}
