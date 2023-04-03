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
    @State private var festivalName: String = ""
    var onSave: (CreneauVM) -> Void
    private let festivalIntent = FestivalIntent(model: FestivalVM(festival: FestivalDTO(id: 0, nom: "", annee: 0, isActive: false)))

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
                        
                        Text("Heure début: \(creneau.heureDebut):\(creneau.minuteDebut)")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Heure fin: \(creneau.heureFin):\(creneau.minuteFin)")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Festival: \(festivalName)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                    }
                    .padding()
                    Spacer()
                }
                .navigationBarTitle(Text("Creneau"), displayMode: .inline)
                .onAppear {
                    if creneau.id_jour != 0 {
                        let festivalId = creneau.id_jour
                        festivalIntent.fetchFestivalName(byId: festivalId) { result in
                            switch result {
                            case .success(let festivalName):
                                DispatchQueue.main.async {
                                    self.festivalName = festivalName
                                }
                            case .failure(let error):
                                print("Error fetching festival name: \(error)")
                            }
                        }
                    }
                }
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

