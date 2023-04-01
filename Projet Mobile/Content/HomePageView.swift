//
//  HomePage.swift
//  Projet Mobile
//
//  Created by etud on 16/03/2023.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        VStack {
            Image("Festiland_BIG").resizable().aspectRatio(contentMode: .fit)
            Text("Bienvenu sur notre application de gestion de festivals!")
                .font(.largeTitle)
                .padding()
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
