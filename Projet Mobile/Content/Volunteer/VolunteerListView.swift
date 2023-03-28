//
//  VolunteerListView.swift
//  Projet Mobile
//
//  Created by etud on 27/03/2023.
//

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
                /*.navigationBarItems(
                                leading: Button(action: {
                                    editMode?.wrappedValue = editMode?.wrappedValue == .active ? .inactive : .active
                                }) {
                                    Text(editMode?.wrappedValue == .active ? "OK" : "Modifier")
                                },
                                trailing: Button(action: {
                                    showCreateVolunteer.toggle()
                                }) {
                                    Image(systemName: "plus")
                                })*/
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

/*
import SwiftUI

struct VolunteerListView: View {
    @ObservedObject var volunteerListVM: VolunteerListVM
    
    init() {
        self.volunteerListVM = VolunteerListVM()
        self.volunteerListVM.fetchVolunteers()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(volunteerListVM.volunteers) { volunteer in
                    NavigationLink(
                        destination: Text(volunteer.prenom),
                        label: {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(volunteer.nom)
                                        .font(.headline)
                                    Text(volunteer.email)
                                        .font(.subheadline)
                                }
                                Spacer()
                                if volunteer.isAdmin {
                                    Text("Admin")
                                        .font(.caption)
                                        .foregroundColor(.blue)
                                }
                            }
                        })
                }
                .onDelete { indexSet in
                    //TODO: attention ça supprime directement sans confirmation !!!
                    for index in indexSet {
                        let id = volunteerListVM.volunteers[index].id
                        VolunteerIntent.delete(id, volunteerListVM).process()
                    }
                }
            }
            .navigationBarTitle("Volunteers")
            .navigationBarItems(trailing: NavigationLink(destination: Text("Add Volunteer")) {
                Image(systemName: "plus")
            })
        }
    }
}

struct VolunteerListView_Previews: PreviewProvider {
    static var previews: some View {
        VolunteerListView()
    }
}
*/
