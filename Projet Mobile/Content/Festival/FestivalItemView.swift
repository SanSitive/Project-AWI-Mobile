//
//  FestivalItemView.swift
//  Projet Mobile
//
//  Created by etud on 23/03/2023.
//

import SwiftUI

struct FestivalItemView: View {
    @ObservedObject var festival: FestivalVM
    @State var isActiveZone : Bool = true
    
    init(festival: FestivalVM) {
        self.festival = festival
    }
    
    var body: some View {
        VStack{
            Spacer()
            VStack{
                Text("\(festival.nom)")
                Text("\(festival.annee)")
                Text("\(String(festival.isActive))")
            }
            HStack{
                Spacer()
                Button(action: {
                                self.isActiveZone = true
                            }) {
                                Text("Zone")
                                    .frame(width: 150, height: 50)
                                    .background(isActiveZone ? Color.purple : Color.white)
                                    .foregroundColor(isActiveZone ? Color.white : Color.black)
                                    .cornerRadius(25)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(isActiveZone ? Color.purple : Color.black, lineWidth: 2)
                                    )
                            }
                Button(action: {
                                                                self.isActiveZone = false
                                                            }) {
                                                                Text("Jours")
                                                                    .frame(width: 150, height: 50)
                                                                    .background(!isActiveZone ? Color.purple : Color.white)
                                                                    .foregroundColor(!isActiveZone ? Color.white : Color.black)
                                                                    .cornerRadius(25)
                                                                    .overlay(
                                                                        RoundedRectangle(cornerRadius: 25)
                                                                            .stroke(!isActiveZone ? Color.purple : Color.black, lineWidth: 2)
                                                                    )
                                                            }
                                                Spacer()
                                            }
                                            if(isActiveZone){
                                                FestivalZoneListView(festivalZones: FestivalZoneListVM(festivalZones: []), zones: ZoneListVM(zones: []), festivalActifId: festival.id)
                                            }else{
                                                JourListView()
                                            }
                                            Spacer()
                                        }
                                        
                                    }
                                }

                                struct FestivalItemView_Previews: PreviewProvider {
                                    static var previews: some View {
                                        FestivalItemView(festival: FestivalVM(festival: FestivalDTO(id: 0, nom: "test", annee: 2023, isActive: true)))
                                    }
                                }
