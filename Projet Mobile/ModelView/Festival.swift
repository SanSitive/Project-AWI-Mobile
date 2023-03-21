//
//  Festival.swift
//  Projet Mobile
//
//  Created by etud on 21/03/2023.
//

import Foundation

struct FestivalDTO : Decodable{
  var id : Int?
  var nom : String
  var annee : Int
  var isActive : Bool
    
  static func festivalDTO2Festival(data: [FestivalDTO]) -> [Festival]?{
    var festivals: [Festival] = []
    for fdata in data{
      guard (fdata.id != nil) else{
          return nil
      }
      let id : Int = fdata.id!
      let festival : Festival = Festival(id: id, nom: fdata.nom, annee: fdata.annee, isActive: fdata.isActive)
      festivals.append(festival)
    }
    return festivals
  }
}

class Festival: ObservableObject{
  private var id : Int
  private(set) var nom : String
  private(set) var annee : Int
  private(set) var isActive : Bool
  
  init(id: Int, nom: String, annee: Int, isActive: Bool) {
    self.id = id
    self.nom = nom
    self.annee = annee
    self.isActive = isActive
  }
}
