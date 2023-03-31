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
    @State var nbBenevolesNecessaires : Int = 0
    @ObservedObject var zones : ZoneListVM
    var zonesIntent : ZoneListIntent
    var festivalActifId : Int
    
    init(festivalZones: FestivalZoneListVM, zones: ZoneListVM, festivalActifId: Int){
        self.festivalActifId = festivalActifId
        self.zones = zones
        self.zonesIntent = ZoneListIntent(model: zones)
        self.festivalZones = festivalZones
        //fetch les zones dans la bd
    
    }
    
    var body: some View {
        VStack{
            Text("bonjour, je suis la liste de bénévole")
            List {
//                Picker("Flavor", selection: $zones.zones[0].label) {
//                    ForEach(zones.zones) { label in
//                        Text(label.capitalized)
//                            .tag(label)
//                    }
//                }
                Picker("Zones", selection: .constant(0)) {
                    ForEach(0..<zones.zones.count) { index in
                        Text(zones.zones[index].label)
                    }
                }
                Text("Selected zone: \(zones.zones[0].label)")
                HStack {
                    Text("Nombre de bénévoles nécessaires :")
                    Spacer()
                    Stepper("\(nbBenevolesNecessaires)", value: $nbBenevolesNecessaires)
                        .foregroundStyle(.secondary)
                }
            }

        }.task{
            await zonesIntent.getZones()
        }
    }
}

struct FestivalZoneList_Previews: PreviewProvider {
    static var previews: some View {
        FestivalZoneListView(festivalZones: FestivalZoneListVM(festivalZones: []), zones: ZoneListVM(zones: []), festivalActifId: 2)
    }
}
