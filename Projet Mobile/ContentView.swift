//
//  ContentView.swift
//  Projet Mobile
//
//  Created by etud on 14/03/2023.
//

import SwiftUI


struct ContentView: View {
    @StateObject var appSettings = MyEnvVariables()
    @StateObject var connectedVolunteer = ConnectedVolunteer()
    
    var body: some View {
        Footer().environmentObject(appSettings).environmentObject(connectedVolunteer)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
