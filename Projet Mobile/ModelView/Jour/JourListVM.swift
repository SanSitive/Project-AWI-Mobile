//
//  JourListVM.swift
//  Projet Mobile
//
//  Created by etud on 31/03/2023.
//

import Foundation
class JourListVM : ObservableObject {

    @Published var jourList : [JourVM]
    @Published var state : JourListState = .ready {
        didSet {
            switch state {
            case .loadingJours:
                debugPrint("state loading FestivalZoneVM")
                break
            case .loadedJours(let newJours):
                //transformation UserDTO en UserViewModel
                self.jourList = newJours.map{ jour in JourVM(jour: jour)}
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

    init(jourList: [JourVM]) {
        self.jourList = jourList
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
        self.jourList.remove(atOffsets: indexSet)
        self.objectWillChange.send()
    }

    func move(fromOffsets indexSet : IndexSet, toOffset index: Int) {
        self.jourList.move(fromOffsets: indexSet, toOffset: index)
        self.objectWillChange.send()
    }
    
    func add(jour: JourVM){
        self.jourList.append(jour)
        self.objectWillChange.send()
    }
}
