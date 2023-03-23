//
//  ManageFestivalView.swift
//  Projet Mobile
//
//  Created by etud on 16/03/2023.
//

import SwiftUI

struct ManageFestivalView: View {
    var body: some View {
        FestivalListView(viewModel: FestivalListVM(festivals: []))
    }
}

struct ManageFestivalView_Previews: PreviewProvider {
    static var previews: some View {
        ManageFestivalView()
    }
}
