//
//  ZoneVM.swift
//  Projet Mobile
//
//  Created by etud on 23/03/2023.
//

import Foundation

class ZoneVM: ObservableObject, Hashable, Equatable{
    @Published  var label : String

    //State management
    @Published var state : ZoneState = .ready {
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
    
    init(zone: ZoneDTO) {
        self.label = zone.label
    }
    
    init(label: String){
        self.label = label
    }
    
    static func == (lhs: ZoneVM, rhs: ZoneVM) -> Bool {
        return lhs.label == rhs.label
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.label)
    }
    
    
}
