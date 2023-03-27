//
//  JourIntent.swift
//  Projet Mobile
//
//  Created by etud on 27/03/2023.
//

import Foundation
import SwiftUI

struct JourIntent {
    
    let API_URL = MyEnvVariables().API_URL
    
    @ObservedObject private var model : JourVM
    
    init(model: JourVM){
        self.model = model
    }
    
   // @ObservedObject private var state : UserListViewModel
    
    func updateFestival() async {
        //Should make the update call to update it
    }
    
    func deleteFestival() async {
        //Should make the delete call to delete it
    }
    
    
}
