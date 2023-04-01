//
//  FestivalZoneItemView.swift
//  Projet Mobile
//
//  Created by etud on 31/03/2023.
//

import SwiftUI

struct FestivalZoneItemView: View {
    
    @ObservedObject var festivalZone : FestivalZoneVM
    @State var inputNbBenevoles : Int
    @State var showAlert : Bool = false
    
    var festivalZoneDAO = FestivalZoneDAO()
    
    init(festivalZone: FestivalZoneVM){
        self.festivalZone = festivalZone
        self.inputNbBenevoles  = festivalZone.nbBenevolesNecessaires
    }
    
    var body: some View {
        VStack{
            Spacer()
            Text(festivalZone.label_zone)
            HStack {
                Text("Nombre de bénévoles nécessaires :")
                Spacer()
                Stepper("\(inputNbBenevoles)", value: $inputNbBenevoles , in:1...10000)
                    .foregroundStyle(.secondary)
            }
            Button("Modifier"){
                showAlert = false
                let festivalZoneToSend = FestivalZoneVM(id_festivalZone: festivalZone.id_festivalZone, id_festival: festivalZone.id_festival, label_zone: festivalZone.label_zone, nbBenevolesNecessaires: inputNbBenevoles)
                festivalZoneDAO.updateFestivalZone(festival_zone: festivalZoneToSend ){result in
                    switch(result){
                        case .success(let succes):
                            //ne fait rien
                            debugPrint("TOut s'est bien passé")
                        case .failure(let failure):
                            showAlert = true
                    }
                    
                }
                
            }
            Spacer()

        }.alert(isPresented: $showAlert) {
            Alert(
                title: Text("ERREUR"),
                message: Text("Une erreur inconnue est apparue")
            )
        }

        //Je rajoute un commentaire pour tester si le push via PArsec marche
    }
}

/*
struct FestivalZoneItemView_Previews: PreviewProvider {
    static var previews: some View {
        FestivalZoneItemView(festivalZone:  FestivalZoneVM(id_festivalZone: 6, id_festival: 2, label_zone: "Esplanade-Gauche 1", nbBenevolesNecessaires: 3))
    }
}*/
