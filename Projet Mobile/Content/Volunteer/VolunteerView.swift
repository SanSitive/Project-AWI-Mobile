//
//  VolunteerView.swift
//  Projet Mobile
//
//  Created by etud on 16/03/2023.
//

import SwiftUI

struct VolunteerView: View {
    @StateObject var benevole : VolunteerVM = VolunteerVM(email:"",nom:"",prenom:"",id:0, isAdmin: false)
    var body: some View {
        VStack{
            TextField("\(benevole.nom)", text:$benevole.nom)
            TextField("\(benevole.prenom)", text:$benevole.prenom)
            TextField("\(benevole.email)", text:$benevole.email)
            Button("updateFirst with input"){
                Task(){
                    VolunteerDAO().updateVolunteer(volunteer: benevole){ result in
                        switch result {
                        case .success(let volunteer):
                            // Do something with the array of Volunteer objects
                            debugPrint(volunteer)
                            
                        case .failure(let error):
                            debugPrint(error)
                            // Handle the error
                        }
                    }
                }
            }
        }.task{
            VolunteerDAO().fetchVolunteers(completion:){ result in
                switch result {
                case .success(let volunteers):
                    // Do something with the array of Volunteer objects
                    debugPrint(volunteers)
                    benevole.id = volunteers[0].id
                    benevole.nom = volunteers[0].nom
                    benevole.email = volunteers[0].email
                    benevole.prenom = volunteers[0].prenom
                    benevole.isAdmin = volunteers[0].isAdmin
                case .failure(let error):
                    debugPrint(error)
                    // Handle the error
                }
            }
        }
    }
}


struct VolunteerView_Previews: PreviewProvider {
    static var previews: some View {
        VolunteerView()
    }
}
