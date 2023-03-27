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

    var body: some View {
        VStack {
            if isEditMode {
                VolunteerFormView(volunteer: volunteer, isEditMode: $isEditMode)
            } else {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Nom :")
                            .font(.headline)
                        Spacer()
                        Text(volunteer.nom)
                    }
                    HStack {
                        Text("Prénom :")
                            .font(.headline)
                        Spacer()
                        Text(volunteer.prenom)
                    }
                    HStack {
                        Text("Email :")
                            .font(.headline)
                        Spacer()
                        Text(volunteer.email)
                    }
                    HStack {
                        Text("Administrateur :")
                            .font(.headline)
                        Spacer()
                        Text(volunteer.isAdmin ? "Oui" : "Non")
                    }
                }
                .padding()
            }
        }
        .navigationBarItems(trailing: Button(action: {
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
