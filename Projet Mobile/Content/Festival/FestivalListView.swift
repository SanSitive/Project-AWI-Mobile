//
//  FestivalListView.swift
//  Projet Mobile
//
//  Created by etud on 23/03/2023.
//

import Foundation
import SwiftUI

struct FestivalListView: View {
    
    
    @ObservedObject var festivals : FestivalListVM
    var festivalListIntent : FestivalListIntent
    
    init(viewModel : FestivalListVM){
        self.festivals = viewModel
        self.festivalListIntent = FestivalListIntent(model: viewModel)
    }
    
    var body : some View {
        VStack{
            NavigationView{
                VStack {
                    List{
                        ForEach(festivals.festivals, id: \.self) { festival in
                            NavigationLink(destination: FestivalItemView(festival: festival)){
                                Text(festival.nom)
                            }
                        }
                    }
                }
            //}.onAppear(){
              //  debugPrint("chargement data ?")
              //  Task{
               //     await userIntent.getUsers(of: users)
             //   }
            }.task {
                debugPrint("chargement data ?")
                    await festivalListIntent.getFestivals()
            }
        }
    }
}

struct FestivalListView_Previews: PreviewProvider {
    static var previews: some View {
        FestivalListView(viewModel: FestivalListVM(festivals: [] ))
    }
}
