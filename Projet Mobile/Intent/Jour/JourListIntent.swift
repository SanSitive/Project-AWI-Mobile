//
//  JourListIntent.swift
//  Projet Mobile
//
//  Created by etud on 31/03/2023.
//

import Foundation
import SwiftUI

struct JourListIntent {
    
    let API_URL = MyEnvVariables().API_URL
    let dao = JourDAO()
    
    @ObservedObject private var model : JourListVM
    
    init(model: JourListVM){
        self.model = model
    }
    
    func getJours(id: Int) async {
        self.model.state = .loadingJours
        let urlToUse = API_URL+"jours/festival/\(id)"
        debugPrint(urlToUse)
        guard let url = URL(string: urlToUse) else {
            debugPrint("bad url getFestivals")
            return
        }
        debugPrint("après l'url")
        do{
            debugPrint("avantle fetch")
            let (data, response) = try await URLSession.shared.data(from: url)
            let sdata = String(data: data, encoding: .utf8)!
            let httpresponse = response as! HTTPURLResponse
            debugPrint("aprèsle fetch")
            if httpresponse.statusCode == 200{
                debugPrint("avant le decoded")
                debugPrint(sdata)
                guard let decoded : [JourDTO] = await JSONHelper.decode(data: data) else{
                    return
                }
                debugPrint("après decoded")
                debugPrint(decoded)
                model.state = .loadedJours(decoded)
                debugPrint("C BON G LES JOURSs")
            }
            else{
                debugPrint("error \(httpresponse.statusCode):\(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
            }
        }
        catch{
            debugPrint("bad request")
        }
    }
    
    
    
    
}
