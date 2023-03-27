//
//  VolunteerFormView.swift
//  Projet Mobile
//
//  Created by etud on 27/03/2023.
//

import SwiftUI

struct VolunteerFormView: View {
    @ObservedObject var volunteer: VolunteerVM
    @Binding var isEditMode: Bool

    var body: some View {
        Form {
            Section(header: Text("Informations")) {
                TextField("Nom", text: $volunteer.nom)
                TextField("Prénom", text: $volunteer.prenom)
                TextField("Email", text: $volunteer.email)
                Toggle("Administrateur", isOn: $volunteer.isAdmin)
            }
        }
        .navigationBarTitle(isEditMode ? "Modifier le bénévole" : "Créer un bénévole", displayMode: .inline)
    }
}

//struct VolunteerFormView_Previews: PreviewProvider {
//    static var previews: some View {
//        VolunteerFormView()
//    }
//}
