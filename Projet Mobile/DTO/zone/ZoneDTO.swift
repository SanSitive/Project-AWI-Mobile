//
//  ZoneDTO.swift
//  Projet Mobile
//
//  Created by etud on 23/03/2023.
//

import Foundation


struct ZoneDTO : Decodable{
  var label : String
}

struct ResponseZone: Decodable{
    var result : [ZoneDTO]
}
