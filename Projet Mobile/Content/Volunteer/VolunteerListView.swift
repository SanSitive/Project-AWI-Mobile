//
//  VolunteerListView.swift
//  Projet Mobile
//
//  Created by etud on 27/03/2023.
//

import SwiftUI

struct VolunteerListView: View {
    @EnvironmentObject var volunteerEnvironment: VolunteerEnvironment
    @State private var showCreateVolunteer = false
    @Environment(\.editMode) var editMode

    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(volunteerEnvironment.volunteers) { volunteer in
                        NavigationLink(destination: VolunteerView(volunteer: volunteer)) {
                            Text("\(volunteer.prenom) \(volunteer.nom)")
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            let id = volunteerEnvironment.volunteers[index].id
                            volunteerEnvironment.process(intent: .delete(id))
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
                    CreateVolunteerView()
                        .environmentObject(volunteerEnvironment)
                }
            }
            .onAppear {
                volunteerEnvironment.process(intent: .fetch)
            }
        }
    }
}

struct VolunteerListView_Previews: PreviewProvider {
    static var previews: some View {
        VolunteerListView().environmentObject(VolunteerEnvironment())
    }
}
/*
import SwiftUI

struct VolunteerListView: View {
    @StateObject var volunteerListVM = VolunteerListVM()
    @State private var showCreateVolunteer = false
    @Environment(\.editMode) var editMode

    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(volunteerListVM.volunteers) { volunteer in
                        NavigationLink(destination: VolunteerView(volunteer: volunteer)) {
                            Text("\(volunteer.prenom) \(volunteer.nom)")
                        }
                    }
                    .onDelete { indexSet in
                        //TODO: attention ça supprime directement sans confirmation !!!
                        for index in indexSet {
                            let id = volunteerListVM.volunteers[index].id
                            VolunteerIntent.delete(id, volunteerListVM).process()
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
                    CreateVolunteerView(volunteerListVM: volunteerListVM)
                }
            }
            .onAppear {
                volunteerListVM.fetchVolunteers()
            }
            Footer()
        }
    }
}

struct VolunteerListView_Previews: PreviewProvider {
    static var previews: some View {
        VolunteerListView()
    }
}
*/
