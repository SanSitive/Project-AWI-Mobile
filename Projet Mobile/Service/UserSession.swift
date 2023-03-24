//
//  UserSession.swift
//  Projet Mobile
//
//  Created by etud on 24/03/2023.
//

import Foundation

class UserSession {

    static let shared = UserSession()
    
    var user: VolunteerVM?
    
    private init() {}
}
