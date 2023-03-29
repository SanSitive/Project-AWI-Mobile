//
//  FestivalZoneVM.swift
//  Projet Mobile
//
//  Created by etud on 28/03/2023.
//

import Foundation

class FestivalZoneVM: ObservableObject, Hashable, Equatable{
    @Published  var id_festivalZone : Int
    @Published  var id_festival : Int
    @Published  var label_zone : String
    @Published  var nbBenevolesNecessaires : Int

    //State management
    @Published var state : FestivalZoneState = .ready {
        didSet {
            switch state {
            case .error:
                debugPrint("error")
                self.state = .ready
                break
            case .ready:
                debugPrint("FestivalZoneViewModel: ready state")
                debugPrint("--------------------------------------")
                break
            default:
                break
            }
        }
    }

    init(festivalZone: FestivalZoneDTO) {
        self.id_festivalZone = festivalZone.id_festivalZone
        self.id_festival = festivalZone.id_festival
        self.nbBenevolesNecessaires = festivalZone.nbBenevolesNecessaires
        self.label_zone = festivalZone.label_zone
    }

    static func == (lhs: FestivalZoneVM, rhs: FestivalZoneVM) -> Bool {
        return lhs.id_festivalZone == rhs.id_festivalZone
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id_festivalZone)
    }


}

