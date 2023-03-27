//
//  VolunteerIntent.swift
//  Projet Mobile
//
//  Created by Lexay on 27/03/2023.
//

enum VolunteerIntent {
    case create(volunteer: VolunteerVM)
    case update(volunteer: VolunteerVM)
    case delete(id: Int)
}
