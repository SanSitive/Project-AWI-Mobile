//
//  FestivalZoneVM.swift
//  Projet Mobile
//
//  Created by etud on 28/03/2023.
//

import Foundation


class FestivalZoneVM : ObservableObject, Hashable, Equatable{
    
    @Published var id_festivalZone : Int
    @Published var id_festival : Int
    @Published var label_zone : String
    @Published var nbBenevolesNecessaires : Int
    
    
    init(id_festivalZone: Int, id_festival: Int, label_zone: String, nbBenevolesNecessaires: Int){
        self.id_festival = id_festival
        self.id_festivalZone = id_festivalZone
        self.label_zone = label_zone
        self.nbBenevolesNecessaires = nbBenevolesNecessaires
    }
    
    init(festivalZone: FestivalZoneDTO){
        self.id_festival = festivalZone.id_festival
        self.id_festivalZone = festivalZone.id_festivalZone
        self.label_zone = festivalZone.label_zone
        self.nbBenevolesNecessaires = festivalZone.nbBenevolesNecessaires
    }
    
    static func == (lhs: FestivalZoneVM, rhs: FestivalZoneVM) -> Bool {
        return lhs.id_festivalZone == rhs.id_festivalZone
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id_festivalZone)
    }

}
