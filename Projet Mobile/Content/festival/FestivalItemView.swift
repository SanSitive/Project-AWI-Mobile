//
//  FestivalItemView.swift
//  Projet Mobile
//
//  Created by etud on 23/03/2023.
//

import SwiftUI

struct FestivalItemView: View {
    @ObservedObject var festival: FestivalVM
    
    init(festival: FestivalVM) {
        self.festival = festival
    }
    
    var body: some View {
        VStack{
            Text("\(festival.nom)")
            Text("\(festival.annee)")
            Text("\(String(festival.isActive))")
        }
    }
}

//struct FestivalItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        FestivalItemView()
//    }
//}
