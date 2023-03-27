//
//  JourVM.swift
//  Projet Mobile
//
//  Created by etud on 27/03/2023.
//

import Foundation

class JourVM: ObservableObject, Hashable, Equatable{
    @Published  var id : Int
    @Published  var id_festival : Int
    @Published  var date : Date
    @Published  var nom : String
    @Published  var heureOuverture : Int
    @Published  var heureFermeture : Int
    @Published  var minuteOuverture : Int
    @Published  var minuteFermeture : Int
    

    //State management
    @Published var state : JourState = .ready {
        didSet {
            switch state {
            case .error:
                debugPrint("error")
                self.state = .ready
                break
            case .ready:
                debugPrint("JourViewModel: ready state")
                debugPrint("--------------------------------------")
                break
            default:
                break
            }
        }
    }
    
    init(jour: JourDTO) {
        
        self.id = jour.id
        self.id_festival = jour.id_festival
        self.date = jour.date
        self.nom = jour.nom
        self.heureOuverture = jour.heureOuverture
        self.heureFermeture = jour.heureFermeture
        self.minuteOuverture = jour.minuteOuverture
        self.minuteFermeture = jour.minuteFermeture
        
    }
    
    
    static func == (lhs: JourVM, rhs: JourVM) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    
}
