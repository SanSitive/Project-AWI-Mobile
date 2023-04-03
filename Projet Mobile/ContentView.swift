//
//  ContentView.swift
//  Projet Mobile
//
//  Created by etud on 14/03/2023.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var connectedVolunteer: ConnectedVolunteer
    
    var body: some View {
        Footer().environmentObject(connectedVolunteer)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
