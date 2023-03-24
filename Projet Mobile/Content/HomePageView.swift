//
//  HomePage.swift
//  Projet Mobile
//
//  Created by etud on 16/03/2023.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
            NavigationView {
                        VStack {
                            Text("Welcome to the Festival App!")
                                .font(.largeTitle)
                                .padding()
                            NavigationLink(destination: FestivalListView(viewModel: FestivalListVM(festivals: []) )) {
                                Text("Liste de festival")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                            NavigationLink(destination: VolunteerView()) {
                                Text("Bénévole")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.green)
                                    .cornerRadius(10)
                            }
                            Spacer()
                            Footer()
                            
                        }
                    }
        
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
