//
//  Festival.swift
//  Projet Mobile
//
//  Created by etud on 21/03/2023.
//

import Foundation

class FestivalVM: ObservableObject, Hashable, Equatable{
    @Published  var id : Int
    @Published  var nom : String
    @Published  var annee : Int
    @Published  var isActive : Bool

    //State management
    @Published var state : FestivalState = .ready {
        didSet {
            switch state {
            case .error:
                debugPrint("error")
                self.state = .ready
                break
            case .ready:
                debugPrint("FestivalViewModel: ready state")
                debugPrint("--------------------------------------")
                break
            default:
                break
            }
        }
    }
    
    init(festival: FestivalDTO) {
        self.id = festival.id
        self.nom = festival.nom
        self.annee = festival.annee
        self.isActive = festival.isActive
    }
    
    static func == (lhs: FestivalVM, rhs: FestivalVM) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    
}
