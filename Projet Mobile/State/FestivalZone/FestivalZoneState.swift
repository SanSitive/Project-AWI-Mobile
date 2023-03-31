//
//  FestivalZoneListState.swift
//  Projet Mobile
//
//  Created by etud on 30/03/2023.
//

import Foundation
enum FestivalZoneListState {//}: Equatable {//: CustomStringConvertible {//, Equatable {
    case ready
    case error
    case loadingFestivalZones
    case loadedFestivalZones([FestivalZoneDTO])
    
}
