//
//  VolunteerView.swift
//  Projet Mobile
//
//  Created by etud on 16/03/2023.
//

import SwiftUI

struct VolunteerView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var volunteer: VolunteerVM
    @State private var isEditMode: Bool = false
    var onSave: (VolunteerVM) -> Void

    var body: some View {
        VStack {
            if isEditMode {
                VolunteerFormView(volunteer: volunteer, isEditMode: $isEditMode)
            } else {
                VStack {
                    Spacer()
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                    Spacer()
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Nom: \(volunteer.nom)")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Prénom: \(volunteer.prenom)")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Email: \(volunteer.email)")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Administrateur: \(volunteer.isAdmin ? "Oui" : "Non")")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    .padding()
                    Spacer()
                }
                .navigationBarTitle(Text("Volunteer"), displayMode: .inline)
            }
        }
        .navigationBarItems(trailing: Button(action: {
            if isEditMode {
                onSave(volunteer)
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
