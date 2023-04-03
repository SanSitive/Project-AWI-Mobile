//
//  VolunteerListView.swift
//  Projet Mobile
//
//  Created by etud on 27/03/2023.
//

import SwiftUI

struct VolunteerListView: View {
    @State private var showCreateVolunteer = false
    @Environment(\.editMode) var editMode
    @ObservedObject var volunteerListVM: VolunteerListVM
    let volunteerIntent: VolunteerIntent
    
    init() {
        let vm = VolunteerListVM()
        let intent = VolunteerIntent(viewModel: vm)
        self.volunteerListVM = vm
        self.volunteerIntent = intent
    }

    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(volunteerListVM.volunteers) { volunteer in
                        NavigationLink(destination: VolunteerView(volunteer: volunteer, onSave: { updatedVolunteer in
                            volunteerIntent.perform(action: .update(updatedVolunteer))
                        })) {
                            Text("\(volunteer.prenom) \(volunteer.nom)")
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            let id = volunteerListVM.volunteers[index].id
                            volunteerIntent.perform(action: .delete(id))
                        }
                    }
                }
                .navigationTitle("Bénévoles")
                .navigationBarItems(leading: EditButton(),
                                    trailing: Button(action: {
                                        showCreateVolunteer.toggle()
                                    }) {
                                        Image(systemName: "plus")
                                    })
                .sheet(isPresented: $showCreateVolunteer) {
                    CreateVolunteerView(volunteerIntent: volunteerIntent)
                }
            }
            .onAppear {
                volunteerIntent.perform(action: .read)
            }
        }
    }
}

struct VolunteerListView_Previews: PreviewProvider {
    static var previews: some View {
        VolunteerListView()
    }
}
