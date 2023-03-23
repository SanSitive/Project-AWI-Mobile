//
//  ZoneState.swift
//  Projet Mobile
//
//  Created by etud on 23/03/2023.
//

import Foundation
enum ZoneState {//}: Equatable {//: CustomStringConvertible {//, Equatable {
    case ready
    case changingName(String)
    case loadingZone
    case loadedZone(ZoneDTO)
    case error
   
}
