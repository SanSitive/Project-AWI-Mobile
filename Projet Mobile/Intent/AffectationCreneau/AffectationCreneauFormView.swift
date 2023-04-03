//
//  AffectationCreneauFormView.swift
//  Projet Mobile
//
//  Created by etud on 03/04/2023.
//

import SwiftUI

struct AffectationCreneauFormView: View {
    @ObservedObject var affectationCreneau: AffectationCreneauVM
    @Binding var isEditMode: Bool

    var body: some View {
        Form {
            Section(header: Text("Créneau ID")) {
                TextField("Créneau ID", text: $affectationCreneau.id_creneau_str)
                    .keyboardType(.numberPad)
            }
            Section(header: Text("Bénévole ID")) {
                TextField("Bénévole ID", text: $affectationCreneau.id_benevole_str)
                    .keyboardType(.numberPad)
            }
        }
    }
}
