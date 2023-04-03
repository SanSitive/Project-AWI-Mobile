//
//  FestivalZoneListIntent.swift
//  Projet Mobile
//
//  Created by etud on 31/03/2023.
//

import Foundation
import SwiftUI

struct FestivalZoneListIntent {
    
    let API_URL = MyEnvVariables().API_URL
    let dao = FestivalZoneDAO()
    
    @ObservedObject private var model : FestivalZoneListVM
    
    init(model: FestivalZoneListVM){
        self.model = model
    }
    
    func getFestivalZones(id: Int) async {
        self.model.state = .loadingFestivalZones
        let urlToUse = API_URL+"festival_zones/festival/\(id)"
        debugPrint(urlToUse)
        guard let url = URL(string: urlToUse) else {
            debugPrint("bad url getFestivals")
            return
        }
        do{
            let (data, response) = try await URLSession.shared.data(from: url)
            let sdata = String(data: data, encoding: .utf8)!
            let httpresponse = response as! HTTPURLResponse
            if httpresponse.statusCode == 200{
                guard let decoded : [FestivalZoneDTO] = await JSONHelper.decode(data: data) else{
                    return
                }
                model.state = .loadedFestivalZones(decoded)
                
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
