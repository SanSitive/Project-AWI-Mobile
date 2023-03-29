//
//  FestivalZoneState.swift
//  Projet Mobile
//
//  Created by etud on 28/03/2023.
//

import Foundation
enum FestivalZoneState {//}: Equatable {//: CustomStringConvertible {//, Equatable {
    case ready
    case changingNbBenevolesNecessaires(Int)
    case loadingFestivalZone
    case loadedFestivalZone(FestivalZoneDTO)
    case error
}
