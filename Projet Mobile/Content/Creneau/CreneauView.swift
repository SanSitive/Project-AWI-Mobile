//
//  CreneauView.swift
//  Projet Mobile
//
//  Created by etud on 31/03/2023.
//

import SwiftUI

struct CreneauView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var creneau: CreneauVM
    @State private var isEditMode: Bool = false
    var onSave: (CreneauVM) -> Void
    
    var body: some View {
        VStack {
            if isEditMode {
                CreneauFormView(creneau: creneau, isEditMode: $isEditMode)
            } else {
                VStack {
                    Spacer()
                    Text("Creneau")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    VStack(alignment: .leading, spacing: 10) {
                        Text("ID Jour: \(creneau.id_jour)")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Heure début: \(creneau.heureDebut):\(creneau.minuteDebut)")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Heure fin: \(creneau.heureFin):\(creneau.minuteFin)")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    .padding()
                    Spacer()
                }
                .navigationBarTitle(Text("Creneau"), displayMode: .inline)
            }
        }
        .navigationBarItems(trailing: Button(action: {
            if isEditMode {
                onSave(creneau)
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

struct CreneauView_Previews: PreviewProvider {
    static var previews: some View {
        CreneauView(creneau: CreneauVM(id: 1, id_jour: 1, heureDebut: 9, heureFin: 12, minuteDebut: 0, minuteFin: 0), onSave: { _ in })
    }
}
