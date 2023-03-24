//
//  FestivalDTO.swift
//  Projet Mobile
//
//  Created by etud on 23/03/2023.
//

import Foundation

struct FestivalDTO : Decodable{
  var id : Int
  var nom : String
  var annee : Int
  var isActive : Bool
    
}

struct ResponseFestival: Decodable{
    var result : [FestivalDTO]
}
