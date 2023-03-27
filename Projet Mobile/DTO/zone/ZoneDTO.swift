//
//  ZoneDTO.swift
//  Projet Mobile
//
//  Created by etud on 23/03/2023.
//

import Foundation


struct ZoneDTO : Codable{
  var label : String
    
    
    init(zone: ZoneVM) {
        self.label = zone.label
    }
    
    init(label: String) {
        self.label = label
    }
    
    func toModel() -> ZoneVM {
        return ZoneVM(label:self.label)
    }

    static func fromModel(_ model: ZoneVM) -> ZoneDTO {
        return ZoneDTO(zone: model)
    }
}

struct ResponseZone: Decodable{
    var result : [ZoneDTO]
}
