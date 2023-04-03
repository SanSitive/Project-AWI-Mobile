//
//  ProfileView.swift
//  Projet Mobile
//
//  Created by etud on 31/03/2023.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var connectedVolunteer: ConnectedVolunteer
    @State private var isEditMode: Bool = false
    @State private var password: String = ""
    private var authIntent: AuthIntent {
        AuthIntent(connectedVolunteer: connectedVolunteer)
    }
    var volunteerIntent: VolunteerIntent
    
    //TODO: A VERIFIER ??
    private var volunteer: VolunteerVM {
        return VolunteerVM(volunteer: connectedVolunteer.volunteer!)
    }
    
    var body: some View {
        VStack {
            if isEditMode {
                VolunteerFormView(volunteer: volunteer, isEditMode: $isEditMode, password: $password)
            } else {
                VStack {
                    Spacer()
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                    Spacer()
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Nom: \(connectedVolunteer.volunteer?.nom ?? "")")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Prénom: \(connectedVolunteer.volunteer?.prenom ?? "")")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Email: \(connectedVolunteer.volunteer?.email ?? "")")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Administrateur: \(connectedVolunteer.volunteer?.isAdmin == true ? "Oui" : "Non")")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    .padding()
                    Spacer()
                }
                .navigationBarTitle(Text("Profile"), displayMode: .inline)
            }
        }
        .navigationBarItems(trailing: Button(action: {
            if isEditMode {
                // Save changes to the connectedUser here
                volunteerIntent.perform(action: .update(volunteer))
                connectedVolunteer.volunteer = volunteer
            }
            isEditMode.toggle()
        }) {
            Text(isEditMode ? "Enregistrer" : "Modifier")
        })
        .onDisappear {
            if isEditMode {
                isEditMode = false
            }
        }
    }
}

