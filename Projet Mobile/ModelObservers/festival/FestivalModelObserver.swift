//
//  FestivalModelObserver.swift
//  Projet Mobile
//
//  Created by etud on 23/03/2023.
//

import Foundation
protocol FestivalModelObserver {
    func change(name: String)
    func change(annee: Int)
    func change(isActive: Bool)
}

