//
//  MyEnvVariables.swift
//  Projet Mobile
//
//  Created by etud on 22/03/2023.
//

import Foundation

class MyEnvVariables : ObservableObject {
    @Published public var API_URL : String
    
    
    init(){
        guard let filePath = Bundle.main.path(forResource: "EnvironmentSettings", ofType: "plist") else {
            fatalError("Couldn't find file 'config.plist'.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        self.API_URL = plist?.object(forKey: "API_URL") as? String ?? ""
    }
}
