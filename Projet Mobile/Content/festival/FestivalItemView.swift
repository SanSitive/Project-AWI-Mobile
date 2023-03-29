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
                FestivalZoneListView()
            }else{
                JourListView()
            }
            Spacer()
//            TabView {
//                HomePageView()
//                    .badge(2)
//                    .tabItem {
//                        Label("Received", systemImage: "tray.and.arrow.down.fill")
//                    }
//                LoginPageView()
//                    .tabItem {
//                        Label("Sent", systemImage: "tray.and.arrow.up.fill")
//                    }
//                HomePageView()
//                    .badge("!")
//                    .tabItem {
//                        Label("Account", systemImage: "person.crop.circle.fill")
//                    }
//            }
            
        }
        
    }
}

struct FestivalItemView_Previews: PreviewProvider {
    static var previews: some View {
        FestivalItemView(festival: FestivalVM(festival: FestivalDTO(id: 0, nom: "test", annee: 2023, isActive: true)))
    }
}
