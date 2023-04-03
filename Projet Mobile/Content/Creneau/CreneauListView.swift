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
    private let festivalIntent = FestivalIntent(model: FestivalVM(festival: FestivalDTO(id: 0, nom: "", annee: 0, isActive: false)))

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
                            CreneauRowView(creneau: creneau, festivalIntent: festivalIntent)
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

struct CreneauRowView: View {
    let creneau: CreneauVM
    let festivalIntent: FestivalIntent
    
    var body: some View {
        HStack {
            Text("Creneau: \(creneau.heureDebut):\(creneau.minuteDebut)-\(creneau.heureFin):\(creneau.minuteFin)")
            Spacer()
            if creneau.id_jour != 0 {
                let festivalId = creneau.id_jour
                FestivalNameView(festivalId: festivalId, festivalIntent: festivalIntent)
            }
        }
    }
}

struct FestivalNameView: View {
    let festivalId: Int?
    let festivalIntent: FestivalIntent
    
    @State private var festivalName: String?
    
    var body: some View {
        if let festivalId = festivalId, let festivalName = festivalName {
            Text("Festival: \(festivalName)")
                .foregroundColor(.blue)
                .onAppear {
                    festivalIntent.fetchFestivalName(byId: festivalId) { result in
                        switch result {
                        case .success(let name):
                            self.festivalName = name
                        case .failure(let error):
                            print("Error fetching festival name: \(error)")
                        }
                    }
                }
        }
    }
}


struct CreneauListView_Previews: PreviewProvider {
    static var previews: some View {
        CreneauListView()
    }
}
