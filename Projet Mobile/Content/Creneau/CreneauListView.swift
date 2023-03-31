//
//  CreneauListView.swift
//  Projet Mobile
//
//  Created by etud on 31/03/2023.
//

import SwiftUI

struct CreneauListView: View {
    @State private var showCreateCreneau = false
    @Environment(\.editMode) var editMode
    @ObservedObject var creneauListVM: CreneauListVM
    let creneauIntent: CreneauIntent
    
    init() {
        let vm = CreneauListVM()
        let intent = CreneauIntent(viewModel: vm)
        self.creneauListVM = vm
        self.creneauIntent = intent
    }

    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(creneauListVM.creneaux) { creneau in
                        NavigationLink(destination: CreneauView(creneau: creneau, onSave: { updatedCreneau in
                            creneauIntent.perform(action: .update(updatedCreneau))
                        })) {
                            Text("Creneau: \(creneau.id_jour) \(creneau.heureDebut):\(creneau.minuteDebut)-\(creneau.heureFin):\(creneau.minuteFin)")
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            let id = creneauListVM.creneaux[index].id
                            creneauIntent.perform(action: .delete(id))
                        }
                    }
                }
                .navigationTitle("Créneaux")
                .navigationBarItems(leading: EditButton(),
                                    trailing: Button(action: {
                                        showCreateCreneau.toggle()
                                    }) {
                                        Image(systemName: "plus")
                                    })
                .sheet(isPresented: $showCreateCreneau) {
                    CreateCreneauView(creneauIntent: creneauIntent)
                }
            }
            .onAppear {
                creneauIntent.perform(action: .read)
            }
        }
    }
}

struct CreneauListView_Previews: PreviewProvider {
    static var previews: some View {
        CreneauListView()
    }
}
