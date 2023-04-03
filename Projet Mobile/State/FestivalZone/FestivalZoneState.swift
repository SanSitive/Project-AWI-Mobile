//
//  FestivalZoneListState.swift
//  Projet Mobile
//
//  Created by etud on 30/03/2023.
//

import Foundation
<<<<<<< HEAD
enum FestivalZoneState {//}: Equatable {//: CustomStringConvertible {//, Equatable {
    case ready
    case changingNbBenevolesNecessaires(Int)
    case loadingFestivalZone
    case loadedFestivalZone(FestivalZoneDTO)
    case error
=======
enum FestivalZoneListState {//}: Equatable {//: CustomStringConvertible {//, Equatable {
    case ready
    case error
    case loadingFestivalZones
    case loadedFestivalZones([FestivalZoneDTO])
    
>>>>>>> f9ead2bd75fb54f55b237e72424eaf0307bc746c
}
