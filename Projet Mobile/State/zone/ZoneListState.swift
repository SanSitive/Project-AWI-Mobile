//
//  ZoneListState.swift
//  Projet Mobile
//
//  Created by etud on 23/03/2023.
//

import Foundation
enum ZoneListState {//}: Equatable {//: CustomStringConvertible {//, Equatable {
    case ready
    case error
    case loadingZones
    case loadedZones([ZoneDTO])
    
}
