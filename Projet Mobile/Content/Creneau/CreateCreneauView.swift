//
//  CreateCreneauView.swift
//  Projet Mobile
//
//  Created by etud on 31/03/2023.
//

import SwiftUI

struct CreateCreneauView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var creneau = CreneauVM(creneauDTO: CreneauDTO(id: -1, id_jour: 0, heureDebut: 0, heureFin: 0, minuteDebut: 0, minuteFin: 0))
    var creneauIntent: CreneauIntent

    var body: some View {
        NavigationView {
            VStack {
                CreneauFormView(creneau: creneau, isEditMode: .constant(false))
                
                Button(action: {
                    creneauIntent.perform(action: .create(creneau))
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Create Creneau")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 40)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(5)
                }
                .padding()
            }
            .navigationBarTitle("Create Creneau", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

