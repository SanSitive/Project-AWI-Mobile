//
//  ZoneListVM.swift
//  Projet Mobile
//
//  Created by etud on 27/03/2023.
//

import Foundation
class ZoneListVM : ObservableObject {

    @Published var zones : [ZoneVM]
    @Published var state : ZoneListState = .ready {
        didSet {
            switch state {
            case .loadingZones:
                debugPrint("state loading UserVM")
                break
            case .loadedZones(let newZones):
                //transformation UserDTO en UserViewModel
                self.zones = newZones.map{ zone in ZoneVM(zone: zone)}
                debugPrint("jai charge les donnees")
                self.state = .ready
                break
            case .error:
                debugPrint("error")
                //TODO: Modifier la variable error pour la remplir ?
                self.state = .ready
                break
            case .ready:
                debugPrint("TrackViewModel: ready state")
                debugPrint("--------------------------------------")
                break
//            default:
//                break
            }
        }
    }

    init(zones: [ZoneVM]) {
        self.zones = zones
    }

    func change(name: String) {
        self.objectWillChange.send()
    }


    func remove(atOffsets indexSet : IndexSet) {
        self.zones.remove(atOffsets: indexSet)
        self.objectWillChange.send()
    }

    func move(fromOffsets indexSet : IndexSet, toOffset index: Int) {
        self.zones.move(fromOffsets: indexSet, toOffset: index)
        self.objectWillChange.send()
    }
}
