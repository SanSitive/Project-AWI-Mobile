//
//  FestivalZoneListState.swift
//  Projet Mobile
//
//  Created by etud on 30/03/2023.
//

import Foundation

enum FestivalZoneState {//}: Equatable {//: CustomStringConvertible {//, Equatable {
    case ready
    case changingNbBenevolesNecessaires(Int)
    case loadingFestivalZone
    case loadedFestivalZone(FestivalZoneDTO)
    case error
    
}
enum FestivalZoneListState {//}: Equatable {//: CustomStringConvertible {//, Equatable {
    case ready
    case error
    case loadingFestivalZones
    case loadedFestivalZones([FestivalZoneDTO])
    
}
