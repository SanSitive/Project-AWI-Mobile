//
//  JourVM.swift
//  Projet Mobile
//
//  Created by etud on 27/03/2023.
//

import Foundation

extension Date {
    
    func toHour() -> Int{
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: self)
        return hour
    }
    func toMinutes() -> Int{
        let calendar = Calendar.current
        let minute = calendar.component(.minute, from: self)
        return minute
    }
  func toHourAndMinutes() -> String {
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: self)
    let minute = calendar.component(.minute, from: self)
    return "(hour):(minute)"
  }

    func toSimpleDateString() -> String{
        let calendar = Calendar.current
        let day = calendar.component(.day, from: self)
        let month = calendar.component(.month, from: self)
        let year = calendar.component(.year, from: self)
        
        return "\(year)/\(month)/\(day)"
    }
}

class JourVM: ObservableObject, Hashable, Equatable{
    @Published  var id : Int
    @Published  var id_festival : Int
    @Published  var date : Date
    @Published  var nom : String
    @Published  var heureOuverture : Int
    @Published  var heureFermeture : Int
    @Published  var minuteOuverture : Int
    @Published  var minuteFermeture : Int
    

    //State management
    @Published var state : JourState = .ready {
        didSet {
            switch state {
            case .error:
                debugPrint("error")
                self.state = .ready
                break
            case .ready:
                debugPrint("JourViewModel: ready state")
                debugPrint("--------------------------------------")
                break
            default:
                break
            }
        }
    }
    
    init(jour: JourDTO) {
        
        self.id = jour.id
        self.id_festival = jour.id_festival
        self.date = jour.date
        self.nom = jour.nom
        self.heureOuverture = jour.heureOuverture
        self.heureFermeture = jour.heureFermeture
        self.minuteOuverture = jour.minuteOuverture
        self.minuteFermeture = jour.minuteFermeture
        
    }
    
    init(id: Int, id_festival: Int, date: Date, nom: String, heureOuverture: Int, minuteOuverture: Int, heureFermeture: Int, minuteFermeture: Int) {
        
        self.id = id
        self.id_festival = id_festival
        self.date = date
        self.nom = nom
        self.heureOuverture = heureOuverture
        self.heureFermeture = heureFermeture
        self.minuteOuverture = minuteOuverture
        self.minuteFermeture = minuteFermeture
        
    }
    
    
    static func == (lhs: JourVM, rhs: JourVM) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    
}
