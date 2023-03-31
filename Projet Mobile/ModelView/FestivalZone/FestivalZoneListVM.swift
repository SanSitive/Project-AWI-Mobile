//
//  FestivalZoneListVM.swift
//  Projet Mobile
//
//  Created by etud on 30/03/2023.
//

import Foundation
class FestivalZoneListVM : ObservableObject {

    @Published var festivalZones : [FestivalZoneVM]
    @Published var state : FestivalZoneListState = .ready {
        didSet {
            switch state {
            case .loadingFestivalZones:
                debugPrint("state loading FestivalZoneVM")
                break
            case .loadedFestivalZones(let newFestivals):
                //transformation UserDTO en UserViewModel
                self.festivalZones = newFestivals.map{ festival in FestivalZoneVM(festivalZone: festival)}
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
            }
        }
    }

    init(festivalZones: [FestivalZoneVM]) {
        self.festivalZones = festivalZones
    }

    func change(name: String) {
        self.objectWillChange.send()
    }

    func change(isActive: Bool){
        self.objectWillChange.send()
    }

    func change(annee: Int){
        self.objectWillChange.send()
    }

    func remove(atOffsets indexSet : IndexSet) {
        self.festivalZones.remove(atOffsets: indexSet)
        self.objectWillChange.send()
    }

    func move(fromOffsets indexSet : IndexSet, toOffset index: Int) {
        self.festivalZones.move(fromOffsets: indexSet, toOffset: index)
        self.objectWillChange.send()
    }
    
    func add(festivalZone: FestivalZoneVM){
        self.festivalZones.append(festivalZone)
        self.objectWillChange.send()
    }
}
