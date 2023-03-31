//
//  CreneauFormView.swift
//  Projet Mobile
//
//  Created by etud on 31/03/2023.
//

import SwiftUI

struct CreneauFormView: View {
    @ObservedObject var creneau: CreneauVM
    @Binding var isEditMode: Bool

    var body: some View {
        Form {
            Section(header: Text("Informations")) {
                TextField("ID Jour", value: $creneau.id_jour, formatter: NumberFormatter())
                TextField("Heure début", value: $creneau.heureDebut, formatter: NumberFormatter())
                TextField("Minute début", value: $creneau.minuteDebut, formatter: NumberFormatter())
                TextField("Heure fin", value: $creneau.heureFin, formatter: NumberFormatter())
                TextField("Minute fin", value: $creneau.minuteFin, formatter: NumberFormatter())
            }
        }
        .navigationBarTitle(isEditMode ? "Modifier le créneau" : "Créer un créneau", displayMode: .inline)
    }
}

