//
//  VolunteerState.swift
//  Projet Mobile
//
//  Created by etud on 27/03/2023.
//

import Foundation

enum VolunteerState {
    case idle
    case loading
    case loaded([VolunteerVM])
    case error(Error)
}
