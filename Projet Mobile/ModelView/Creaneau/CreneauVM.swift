//
//  CreneauVM.swift
//  Projet Mobile
//
//  Created by etud on 27/03/2023.
//

import Foundation

class CreneauVM: ObservableObject, Hashable, Equatable{
    @Published var id : Int
    @Published var id_jour : Int
    @Published var heureDebut : Int
    @Published var heureFin : Int
    @Published var minuteDebut : Int
    @Published var minuteFin : Int

    //State management
    @Published var state : CreneauState = .ready {
        didSet {
            switch state {
            case .error:
                debugPrint("error")
                self.state = .ready
                break
            case .ready:
                debugPrint("CreneauViewModel: ready state")
                debugPrint("--------------------------------------")
                break
            default:
                break
            }
        }
    }
    
    init(creneau: CreneauDTO) {
        self.id = creneau.id
        self.id_jour = creneau.id_jour
        self.heureDebut = creneau.heureDebut
        self.heureFin = creneau.heureFin
        self.minuteDebut = creneau.minuteDebut
        self.minuteFin = creneau.minuteFin
    }
    
    
    static func == (lhs: CreneauVM, rhs: CreneauVM) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    
}
