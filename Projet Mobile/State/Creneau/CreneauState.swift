//
//  CreneauState.swift
//  Projet Mobile
//
//  Created by etud on 27/03/2023.
//

import Foundation
enum CreneauState {//}: Equatable {//: CustomStringConvertible {//, Equatable {
    case ready
    case changingHeureDebut(Int)
    case changingHeureFin(Int)
    case changingMinuteFin(Int)
    case changingMinuteDebut(Int)
    case loadingCreneau
    case loadedCreneau(CreneauDTO)
    case error
   
}
