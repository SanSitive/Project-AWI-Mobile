//
//  CreateVolunteerView.swift
//  Projet Mobile
//
//  Created by etud on 27/03/2023.
//

import SwiftUI

struct CreateVolunteerView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var volunteerListVM: VolunteerListVM
    @StateObject private var volunteer = VolunteerVM(email: "", nom: "", prenom: "", id: -1, isAdmin: false)
    
    var body: some View {
        NavigationView {
            VStack {
                VolunteerFormView(volunteer: volunteer, isEditMode: .constant(false))
                
                Button(action: {
                    VolunteerIntent.create(volunteer, volunteerListVM).process()
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Create Volunteer")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 40)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(5)
                }
                .padding()
            }
            .navigationBarTitle("Create Volunteer", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct CreateVolunteerView_Previews: PreviewProvider {
    static var previews: some View {
        CreateVolunteerView(volunteerListVM: VolunteerListVM())
    }
}

