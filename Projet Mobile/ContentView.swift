//
//  ContentView.swift
//  Projet Mobile
//
//  Created by etud on 14/03/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var appSettings = MyEnvVariables()
    
    
    var body: some View {
        
        LoginPageView().environmentObject(appSettings)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
