//
//  FestivalIntent.swift
//  Projet Mobile
//
//  Created by etud on 23/03/2023.
//

import Foundation
import SwiftUI

struct FestivalIntent {
    
    let API_URL = MyEnvVariables().API_URL
    
    @ObservedObject private var model : FestivalVM
    
    init(model: FestivalVM){
        self.model = model
    }
    
   // @ObservedObject private var state : UserListViewModel
    
    func getFestival(id: Int) async {
        self.model.state = .loadingFestival
        
        guard let url = URL(string: API_URL+"/festivals/"+String(id))else {
            debugPrint("bad url getFestivals")
            return
        }
        do{
            /*var requete = URLRequest(url: url)
            requete.httpMethod = "GET"
            //append a value to a field
            requete.addValue("application/json", forHTTPHeaderField: "Content-Type")
             */
            //set (replace) a value to a field
            //requete.setValue(<#T##value: String?##String?#>, forHTTPHeaderField: <#T##String#>)
            /*
            guard let encoded = await JSONHelper.encode(data: self.user) else {
                print("pb encodage")
                return
            }
            let (data, response) = try await URLSession.shared.upload(for: requete, from: encoded)*/
            let (data, response) = try await URLSession.shared.data(from: url)
            debugPrint("data normal")
            debugPrint(data)
            let sdata = String(data: data, encoding: .utf8)!
            let httpresponse = response as! HTTPURLResponse
            if httpresponse.statusCode == 200{
               // model.state = .loadedUsers([UserDTO(idUtilisateur: 11, nom: "truc", prenom: "mgd", email: "ege", mdp: "fefe", isAdmin: 1)])
                debugPrint("je suis conne")
                debugPrint("\(sdata)")
                guard let decoded : FestivalDTO = await JSONHelper.decode(data: data) else{
                    debugPrint("mauvaise récup données")
                    return
                }
                
                debugPrint("donneees decodeess")
                debugPrint(decoded)
                model.state = .loadedFestival(decoded)
                
            }
            else{
                debugPrint("error \(httpresponse.statusCode):\(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
            }
        }
        catch{
            debugPrint("bad request")
        }
    }
    
    func updateFestival() async {
        //Should make the update call to update it
    }
    
    func deleteFestival() async {
        //Should make the delete call to delete it
    }
    
    static func createFestival() async {
        //Should make the create call to create it
    }
    
}
