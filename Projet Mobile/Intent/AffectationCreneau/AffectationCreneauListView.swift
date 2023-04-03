//
//  AffectationCreneauListView.swift
//  Projet Mobile
//
//  Created by etud on 03/04/2023.
//

import SwiftUI

struct AffectationCreneauListView: View {
    @State private var showCreateAffectationCreneau = false
    @Environment(\.editMode) var editMode
    @ObservedObject var affectationCreneauListVM: AffectationCreneauListVM
//    let affectationCreneauIntent: AffectationCreneauIntent

    init() {
        let vm = AffectationCreneauListVM()
        let intent = AffectationCreneauIntent(viewModel: vm)
        self.affectationCreneauListVM = vm
        self.affectationCreneauIntent = intent
    }

    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(affectationCreneauListVM.affectationCreneaux) { affectationCreneau in
                        NavigationLink(destination: AffectationCreneauView(affectationCreneau: affectationCreneau, onSave: { updatedAffectationCreneau in
                            affectationCreneauIntent.perform(action: .update(updatedAffectationCreneau))
                        })) {
                            Text("Créneau ID: \(affectationCreneau.id_creneau), Bénévole ID: \(affectationCreneau.id_benevole)")
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            let id_creneau = affectationCreneauListVM.affectationCreneaux[index].id_creneau
                            let id_benevole = affectationCreneauListVM.affectationCreneaux[index].id_benevole
                            affectationCreneauIntent.perform(action: .delete(id_creneau, id_benevole))
                        }
                    }
                }
                .navigationTitle("Affectation Creneaux")
                .navigationBarItems(leading: EditButton(),
                                    trailing: Button(action: {
                                        showCreateAffectationCreneau.toggle()
                                    }) {
                                        Image(systemName: "plus")
                                    })
                .sheet(isPresented: $showCreateAffectationCreneau) {
                    CreateAffectationCreneauView(affectationCreneauIntent: affectationCreneauIntent)
                }
            }
            .onAppear {
                affectationCreneauIntent.perform(action: .read)
            }
        }
    }
}

