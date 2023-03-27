//
//  JourState.swift
//  Projet Mobile
//
//  Created by etud on 27/03/2023.
//

import Foundation
enum JourState {//}: Equatable {//: CustomStringConvertible {//, Equatable {
    case ready
    case changingName(String)
    case changingDate(Date)
    case changingHeureOuverture(Int)
    case changingHeureFermeture(Int)
    case changingMinuteFermeture(Int)
    case changingMinuteOuverture(Int)
    case loadingJour
    case loadedJour(JourDTO)
    case error
   
}
