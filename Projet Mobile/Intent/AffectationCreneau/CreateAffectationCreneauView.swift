//
//  CreateAffectationCreneauView.swift
//  Projet Mobile
//
//  Created by etud on 03/04/2023.
//

import SwiftUI

struct CreateAffectationCreneauView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var affectationCreneau: AffectationCreneauVM
    let affectationCreneauIntent: AffectationCreneauIntent

    init(affectationCreneauIntent: AffectationCreneauIntent) {
        self.affectationCreneau = AffectationCreneauVM(id_benevole: 0, id_festivalZone: 0, id_creneau: 0)
        self.affectationCreneauIntent = affectationCreneauIntent
    }

    var body: some View {
        NavigationView {
            AffectationCreneauFormView(affectationCreneau: affectationCreneau, isEditMode: .constant(true))
                .navigationBarTitle(Text("Nouvelle Affectation"), displayMode: .inline)
                .navigationBarItems(leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Annuler")
                }, trailing: Button(action: {
                    affectationCreneauIntent.perform(action: .create(affectationCreneau))
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Enregistrer")
                })
        }
    }
}

