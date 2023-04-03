//
//  JourListView.swift
//  Projet Mobile
//
//  Created by etud on 29/03/2023.
//

import SwiftUI

struct JourListView: View {
    
    var festivalActif : Int
    
    @State var date = Date()
    @State var nom : String = ""
    @State var dateHeureANDMinuteOuverture = Date()
    @State var dateHeureANDMinuteFermeture = Date()
    

    @ObservedObject var jourList : JourListVM
    var jourListIntent : JourListIntent
    
    @State var errorCreate : String = ""
    @State var showAlert : Bool = false
    
    var dao = JourDAO()
    
    init(festivalActif: Int, jourList: JourListVM){
        self.jourList = jourList
        self.festivalActif = festivalActif
        self.jourListIntent = JourListIntent(model: jourList)
    }
    
    var body: some View {
        VStack{
            Form {
                Section(header: Text("Informations d'un jour")) {
                    TextField("Nom", text: $nom)
                    DatePicker(
                        "Date du jour",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                    DatePicker(
                        "Heure d'ouverture",
                        selection: $dateHeureANDMinuteOuverture,
                        displayedComponents: [.hourAndMinute]
                    )
                    DatePicker(
                        "Heure de fermeture",
                        selection: $dateHeureANDMinuteFermeture,
                        displayedComponents: [.hourAndMinute]
                    )
                    Button("Créer un jour"){
                        errorCreate = ""
                        showAlert = false
                        let jourToSend = JourVM(id: 0, id_festival: festivalActif, date:date ,nom: nom,
                                                heureOuverture: dateHeureANDMinuteOuverture.toHour(), minuteOuverture: dateHeureANDMinuteOuverture.toMinutes(), heureFermeture:dateHeureANDMinuteFermeture.toHour(), minuteFermeture: dateHeureANDMinuteFermeture.toMinutes())
                        dao.createJour(jour: jourToSend){result in
                            switch(result){
                            case .success(let jourVM):
                                jourList.add(jour: jourVM)
                            case .failure(let _error):
                                showAlert = true
                                errorCreate = "Tu ne peux pas créer ce jour car il existe déjà un jour à cette date"
                            }
                        }
                    }
                }
            }
            if(!jourList.jourList.isEmpty){
                List{
                    ForEach(jourList.jourList, id: \.self) { jour in
                        NavigationLink(destination: JourItemView(jour: jour)){
                            Text(jour.nom)
                            Text("Date : \(jour.date.toSimpleDateString())")
                        }
                    }
                }
            }else{
                Text("No jours ")
            }
        }.task{
            await jourListIntent.getJours(id: self.festivalActif)
        }.alert(isPresented: $showAlert) {
            Alert(
                title: Text("ERREUR"),
                message: Text("\(errorCreate)")
            )
        }
        
    }
}

struct JourListView_Previews: PreviewProvider {
    static var previews: some View {
        JourListView(festivalActif: 2, jourList: JourListVM(jourList: []))
    }
}
