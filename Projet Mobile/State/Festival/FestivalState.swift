//
//  FestivalState.swift
//  Projet Mobile
//
//  Created by etud on 23/03/2023.
//

import Foundation
enum FestivalState {//}: Equatable {//: CustomStringConvertible {//, Equatable {
    case ready
    case changingName(String)
    case changingAnnee(Int)
    case changingIsActive(Bool)
    case loadingFestival
    case loadedFestival(FestivalDTO)
    case error
   
}
