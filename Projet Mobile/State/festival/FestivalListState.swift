//
//  FestivalListState.swift
//  Projet Mobile
//
//  Created by etud on 23/03/2023.
//

import Foundation
enum FestivalListState {//}: Equatable {//: CustomStringConvertible {//, Equatable {
    case ready
    case error
    case loadingFestivals
    case loadedFestivals([FestivalDTO])
    
}
