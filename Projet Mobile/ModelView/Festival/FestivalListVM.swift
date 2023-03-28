//
//  FestivalListVM.swift
//  Projet Mobile
//
//  Created by etud on 27/03/2023.
//

import Foundation

class FestivalListVM : ObservableObject, FestivalModelObserver {

    @Published var festivals : [FestivalVM]
    @Published var state : FestivalListState = .ready {
        didSet {
            switch state {
            case .loadingFestivals:
                debugPrint("state loading UserVM")
                break
            case .loadedFestivals(let newFestivals):
                //transformation UserDTO en UserViewModel
                self.festivals = newFestivals.map{ festival in FestivalVM(festival: festival)}
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

    init(festivals: [FestivalVM]) {
        self.festivals = festivals
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
        self.festivals.remove(atOffsets: indexSet)
        self.objectWillChange.send()
    }

    func move(fromOffsets indexSet : IndexSet, toOffset index: Int) {
        self.festivals.move(fromOffsets: indexSet, toOffset: index)
        self.objectWillChange.send()
    }
}
