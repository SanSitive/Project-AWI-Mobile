//
//  ActualView.swift
//  Projet Mobile
//
//  Created by etud on 22/03/2023.
//

import Foundation
class ActualView : ObservableObject{
    @Published var view : ViewEnum
    
    init(view : ViewEnum){
        self.view = view
    }
}
