//
//  Projet_MobileApp.swift
//  Projet Mobile
//
//  Created by etud on 14/03/2023.
//

import SwiftUI

@main
struct Projet_MobileApp: App {
    @StateObject var connectedVolunteer = ConnectedVolunteer()
    
    var body: some Scene {
        WindowGroup{
            ContentView()
                .environmentObject(connectedVolunteer)
        }
    }
}
