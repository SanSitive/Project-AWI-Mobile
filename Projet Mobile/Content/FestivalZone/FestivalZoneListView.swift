//
//  FestivalZoneList.swift
//  Projet Mobile
//
//  Created by etud on 29/03/2023.
//

import SwiftUI

struct FestivalZoneListView: View {
    @ObservedObject var festivalZones : FestivalZoneListVM
    @State var zone : String = "libre"
    @State var nbBenevolesNecessaires : Int = 1
    @State var inputZone : String = ""
    @ObservedObject var zones : ZoneListVM
    @State var errorCreate : String = ""
    @State var showAlert : Bool = false
    
    var zonesIntent : ZoneListIntent
    var festivalZoneListIntent : FestivalZoneListIntent
    var festivalActifId : Int
    var festivalZoneDAO = FestivalZoneDAO()
    
    init(festivalZones: FestivalZoneListVM, zones: ZoneListVM, festivalActifId: Int){
        self.festivalActifId = festivalActifId
        self.zones = zones
        self.zonesIntent = ZoneListIntent(model: zones)
        self.festivalZoneListIntent = FestivalZoneListIntent(model : festivalZones)
        self.festivalZones = festivalZones
       
    
    }
    
    var body: some View {
        VStack{
            List {
                if(!zones.zones.isEmpty){
                    Picker("Zones", selection: $inputZone) {
                        ForEach(0..<zones.zones.count) { index in
                            Text(zones.zones[index].label).tag(zones.zones[index].label)
                        }
                    }
                    HStack {
                        Text("Nombre de bénévoles nécessaires :")
                        Spacer()
                        Stepper("\(nbBenevolesNecessaires)", value: $nbBenevolesNecessaires, in:1...10000)
                            .foregroundStyle(.secondary)
                    }
                    Button("Ajouter"){
                        errorCreate = ""
                        showAlert = false
                        let festivalZoneToSend = FestivalZoneVM(id_festivalZone: 0, id_festival: festivalActifId, label_zone: inputZone, nbBenevolesNecessaires: nbBenevolesNecessaires)
                        festivalZoneDAO.createFestivalZone(festival_zone: festivalZoneToSend){result in
                            switch(result){
                            case .success(let festivalZoneVM):
                                festivalZones.add(festivalZone: festivalZoneVM)
                            case .failure(let _error):
                                showAlert = true
                                errorCreate = "Tu ne peux pas créer cet affectation car elle existe déjà"
                            }
                        }
                    }
                }else{
                    Text("Aucune zones existantes, vous devez d'abord créer une zone avant de pouvoir l'affecter à votre festival")
                }
            }
            if(!festivalZones.festivalZones.isEmpty){
                List{
                    ForEach(festivalZones.festivalZones, id: \.self) { festivalZone in
                        NavigationLink(destination: FestivalZoneItemView(festivalZone: festivalZone)){
                            Text(festivalZone.label_zone)
                            Text("Nombre de bénévole requis : \(festivalZone.nbBenevolesNecessaires)")
                        }
                    }
                }
            }
            Spacer()

        }.task{
            await zonesIntent.getZones()
            await festivalZoneListIntent.getFestivalZones(id: festivalActifId)
            
        }.alert(isPresented: $showAlert) {
            Alert(
                title: Text("ERREUR"),
                message: Text("\(errorCreate)")
            )
        }
    }
}

struct FestivalZoneList_Previews: PreviewProvider {
    static var previews: some View {
        FestivalZoneListView(festivalZones: FestivalZoneListVM(festivalZones: []), zones: ZoneListVM(zones: []), festivalActifId: 2)
    }
}
