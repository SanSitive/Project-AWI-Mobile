//
//  JourListState.swift
//  Projet Mobile
//
//  Created by etud on 31/03/2023.
//

import Foundation
enum JourListState {//}: Equatable {//: CustomStringConvertible {//, Equatable {
    case ready
    case error
    case loadingJours
    case loadedJours([JourDTO])
    
}
