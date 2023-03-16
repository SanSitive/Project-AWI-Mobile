//
//  Footer.swift
//  Projet Mobile
//
//  Created by etud on 16/03/2023.
//

import SwiftUI

struct Footer: View {
    var body: some View {
        VStack {
            Divider()
            HStack {
                NavigationLink(destination: HomeView()) {
                    VStack {
                        Image(systemName: "house")
                        Text("Accueil")
                    }
                }
                Spacer()
                NavigationLink(destination: ExploreView()) {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Explorer")
                    }
                }
                Spacer()
                NavigationLink(destination: ProfileView()) {
                    VStack {
                        Image(systemName: "person.crop.circle")
                        Text("Profil")
                    }
                }
            }
            .font(.headline)
            .padding(.horizontal, 40)
            .padding(.vertical, 10)
        }
        .background(Color.white)
    }
}

struct HomeView: View {
    var body: some View {
        Text("Contenu de l'accueil")
    }
}

struct ExploreView: View {
    var body: some View {
        Text("Contenu de l'exploration")
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Contenu du profil")
    }
}
struct Footer_Previews: PreviewProvider {
    static var previews: some View {
        Footer()
    }
}
