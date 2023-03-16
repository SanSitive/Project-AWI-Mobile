//
//  VolunteerView.swift
//  Projet Mobile
//
//  Created by etud on 16/03/2023.
//

import SwiftUI

struct VolunteerView: View {
    
    var body: some View {
        HStack{
            Text("VolunteerView")
            Button("Fetch a volunteer"){
                let v = VolunteerDTO(id: 1, prenom: "Maxime", nom: "Stefani", email: "maxime@gmail.com" )
                v.callAPI(url: "https://festiland-api.cluster-ig4.igpolytech.fr/benevoles/54")
            }
            
        }
    }
}

struct VolunteerView_Previews: PreviewProvider {
    static var previews: some View {
        VolunteerView()
    }
}
