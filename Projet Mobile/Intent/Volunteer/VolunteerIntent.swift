//
//  VolunteerIntent.swift
//  Projet Mobile
//
//  Created by Lexay on 27/03/2023.
//
import Foundation

enum VolunteerIntent {
    case fetch
    case create(VolunteerVM)
    case update(VolunteerVM)
    case delete(Int)
}
