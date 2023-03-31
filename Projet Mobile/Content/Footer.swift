//
//  Footer.swift
//  Projet Mobile
//
//  Created by Lexay on 16/03/2023.
//

import SwiftUI

struct Footer: View {
    var body: some View {
        TabView {
            HomePageView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Accueil")
                }
            
            FestivalListView(viewModel: FestivalListVM(festivals: [] ))
                .tabItem {
                    Image(systemName: "star")
                    Text("Festivals")
                }
            
            VolunteerListView()
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Bénévoles")
                }

            ScheduleView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Créneaux")
                }
                
            ZonesView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Zones")
                }
        }
    }
}

struct ScheduleView: View {
    var body: some View {
        Text("Contenu de la page à faire")
    }
}

struct ZonesView: View {
    var body: some View {
        Text("Contenu de la page à faire")
    }
}

struct FestivalListViewFalse: View {
    var body: some View {
        Text("Contenu de la page à faire")
    }
}
