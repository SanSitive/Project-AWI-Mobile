//
//  CreateVolunteerView.swift
//  Projet Mobile
//
//  Created by etud on 27/03/2023.
//

import SwiftUI


struct CreateVolunteerView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var volunteer = VolunteerVM(email: "", nom: "", prenom: "", id: -1, isAdmin: false)
    @State private var password: String = ""
    var volunteerIntent: VolunteerIntent

    private func generatePassword() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let dateString = dateFormatter.string(from: Date())
        let name = volunteer.nom.trimmingCharacters(in: .whitespacesAndNewlines)
        let surname = volunteer.prenom.trimmingCharacters(in: .whitespacesAndNewlines)
        return "\(dateString)-\(name)-\(surname)"
    }

    var body: some View {
        NavigationView {
            VStack {
                VolunteerFormView(volunteer: volunteer, isEditMode: .constant(false), password: $password)
                
                Button(action: {
                    password = generatePassword()
                    volunteerIntent.perform(action: .create(volunteer, password: password))
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
        .onAppear {
            password = generatePassword()
        }
    }
}

struct CreateVolunteerView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = VolunteerListVM()
        let intent = VolunteerIntent(viewModel: viewModel)
        return CreateVolunteerView(volunteerIntent: intent)
    }
}
