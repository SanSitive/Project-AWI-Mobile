//
//  AffectationCreneauView.swift
//  Projet Mobile
//
//  Created by etud on 03/04/2023.
//

import SwiftUI

struct AffectationCreneauView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var affectationCreneau: AffectationCreneauVM
    @State private var isEditMode: Bool = false
    var onSave: (AffectationCreneauVM) -> Void

    var body: some View {
        VStack {
            if isEditMode {
                AffectationCreneauFormView(affectationCreneau: affectationCreneau, isEditMode: $isEditMode)
            } else {
                VStack {
                    Spacer()
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Créneau ID: \(affectationCreneau.id_creneau)")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Bénévole ID: \(affectationCreneau.id_benevole)")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    .padding()
                    Spacer()
                }
                .navigationBarTitle(Text("Affectation Creneau"), displayMode: .inline)
            }
        }
        .navigationBarItems(trailing: Button(action: {
            if isEditMode {
                onSave(affectationCreneau)
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

