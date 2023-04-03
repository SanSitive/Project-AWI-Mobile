//
//  Footer.swift
//  Projet Mobile
//
//  Created by Lexay on 16/03/2023.
//

import SwiftUI

struct Footer: View {
    @EnvironmentObject var connectedVolunteer: ConnectedVolunteer

    private var volunteer: VolunteerVM {
        return VolunteerVM(volunteer: connectedVolunteer.volunteer!)
    }
    
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

            LoginPageView()
                .environmentObject(connectedVolunteer)
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Se connecter")
                }
                
            ProfileView(volunteerIntent: VolunteerIntent(viewModel: VolunteerListVM())).environmentObject(connectedVolunteer)
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
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
