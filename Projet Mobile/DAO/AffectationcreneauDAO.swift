Lexay
#6500







Message privé
Message privé:Maxime
ALIAS
Maxime STEFANI, Maxime Stefani





Rechercher




Discussion de
31 mars 2023
 
Maxime — 31/03/2023 10:25
//
//  FestivalZoneVM.swift
//  Projet Mobile
//
//  Created by etud on 28/03/2023.
//

import Foundation


class FestivalZoneVM : ObservableObject, Hashable, Equatable, Identifiable{
    
    @Published var id_festivalZone : Int
    @Published var id_festival : Int
    @Published var label_zone : String
    @Published var nbBenevolesNecessaires : Int
    
    
    init(id_festivalZone: Int, id_festival: Int, label_zone: String, nbBenevolesNecessaires: Int){
        self.id_festival = id_festival
        self.id_festivalZone = id_festivalZone
        self.label_zone = label_zone
        self.nbBenevolesNecessaires = nbBenevolesNecessaires
    }
    
    init(festivalZone: FestivalZoneDTO){
        self.id_festival = festivalZone.id_festival
        self.id_festivalZone = festivalZone.id_festivalZone
        self.label_zone = festivalZone.label_zone
        self.nbBenevolesNecessaires = festivalZone.nbBenevolesNecessaires
    }
    
    static func == (lhs: FestivalZoneVM, rhs: FestivalZoneVM) -> Bool {
        return lhs.id_festivalZone == rhs.id_festivalZone
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id_festivalZone)
    }

}
[10:25]
//
//  FestivalZoneListState.swift
//  Projet Mobile
//
//  Created by etud on 30/03/2023.
//

import Foundation
enum FestivalZoneListState {//}: Equatable {//: CustomStringConvertible {//, Equatable {
    case ready
    case error
    case loadingFestivalZones
    case loadedFestivalZones([FestivalZoneDTO])
    
}


 
Maxime — 31/03/2023 10:47
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


Maxime
 a épinglé
un message
 dans ce salon. Voir tous les
messages épinglés
.
 — 31/03/2023 10:58


 
Lexay — 31/03/2023 15:04
GETS:
/creneaux/
/creneaux/1
CREATE:
/creneaux/
{
    "id_jour":2,
    "heureDebut":14,
    "heureFin":18,
    "minuteDebut":0,
    "minuteFin":0
}
UPDATE:
/creneaux/
{
    "id_jour":2,
    "heureDebut":14,
    "heureFin":16,
    "minuteDebut":0,
    "minuteFin":0
}
DELETE:
/creneaux/id
FINDALLCRENEAUXOFONEJOUR:
/creneaux/jour/1



Lexay
 a épinglé
un message
 dans ce salon. Voir tous les
messages épinglés
.
 — 31/03/2023 15:05


 
Lexay — 31/03/2023 15:57
faire la vue profile



 
Lexay — 31/03/2023 16:06
faire une route qui depuis l'ID du jour donne le nom du festival



Lexay
 a épinglé
un message
 dans ce salon. Voir tous les
messages épinglés
.
 — 31/03/2023 16:06


Lexay
 a épinglé
un message
 dans ce salon. Voir tous les
messages épinglés
.
 — 31/03/2023 16:06


 
Lexay — 31/03/2023 16:06
faire une route qui depuis l'ID du jour donne la date correspondante



Lexay
 a épinglé
un message
 dans ce salon. Voir tous les
messages épinglés
.
 — 31/03/2023 16:07


 
Lexay — 31/03/2023 16:23
Changer la clef primaire de affectationCreneau



Lexay
 a épinglé
un message
 dans ce salon. Voir tous les
messages épinglés
.
 — 31/03/2023 16:24


 
Lexay — 31/03/2023 16:25
changer clef primaire de jour en festival et date



 
Lexay — 31/03/2023 16:48
refactor profileView (au moins le review wtf)



Lexay
 a épinglé
un message
 dans ce salon. Voir tous les
messages épinglés
.
 — 31/03/2023 16:49


1 avril 2023

@Lexay
faire une route qui depuis l'ID du jour donne le nom du festival
 
Maxime — 01/04/2023 11:21
base_url+ getFestivalName/:id (id du jour) (modifié)

@Lexay
faire une route qui depuis l'ID du jour donne la date correspondante
 
Maxime — 01/04/2023 11:21
base_url + getDateByJourId/:id (id du jour) (modifié)
 
Maxime — 01/04/2023 12:32
Bon j'ai refait le back
[12:33]
Tout est déployé 🙂
[12:33]
Du coup je vais :
- Finir la FestivalZoneItemView
- Mettre l'image du logo de l'app sur la homepage
[12:33]
Et après je sais plus si je touche à grand chose sur le moment
Lexay
 a épinglé
un message
 dans ce salon. Voir tous les
messages épinglés
.
 — 01/04/2023 15:06
Lexay
 a épinglé
un message
 dans ce salon. Voir tous les
messages épinglés
.
 — 01/04/2023 15:06

@Maxime
Tout est déployé 🙂
 
Lexay — 01/04/2023 15:07
super let's go !

@Maxime
Et après je sais plus si je touche à grand chose sur le moment
 
Lexay — 01/04/2023 15:08
okay en vrai déjà si on a ça et que je finis profileView + je mets en place les routes que t'as fait pour les créneaux on est bieeeen
[15:09]
le problème c'est qu'au final j'ai pas de mac et que profile c'était un pb de view ^^" je vais voir si je peux quand même le faire avec le mac in cloud
 
Maxime — 01/04/2023 16:56
Image
[16:56]
C'est pour que je puisse l'utiliser sur Parsec
2 avril 2023
 
Lexay — Hier à 16:08
t'utilises le mac parsec là ?
 
Maxime — Hier à 16:08
Nope
[16:08]
Pourquoi ?
[16:09]
D’ailleurs tu voulais pas qu’on se voit aujourd’hui ?
 
Lexay — Hier à 16:09
parce que je vais l'utiliser
euh bah en vrai là je vais coder, après c'est vrai que y'a peut-être pas besoin qu'on se voit
[16:09]
dans tous les cas demain on vient plus tôt nan ?
 
Maxime — Hier à 16:10
Yep
[16:10]
8h pile
[16:10]
Histoire de préparer la presentation et choper les mac
👍
1
 
Lexay — Hier à 16:10
jvais mp Berry au cas où
👍🏻
1
[16:13]
jpp
Image

[16:13]
"oh non je me souviens plus"
 
Maxime — Hier à 16:13
Ahaha
[16:13]
Énorme
[16:13]
Mais faut bien faire les courbettes sinon il viendra pas
 
Lexay — Hier à 16:14
mais oui
3 avril 2023
 
Lexay — Aujourd’hui à 07:26
CreneauListView à tester
 
Lexay — Aujourd’hui à 07:45
Au cas où, dans festivalIntent:
 func fetchFestivalName(byId id: Int, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: "\(API_URL)/getFestivalName/\(id)") else {
            completion(.failure(APIError.urlNotFound(API_URL)))
            return
        }

        Task {
            switch await URLSession.shared.getJSON(from: url) as Result<FestivalNameDTO, APIError> {
            case .success(let festivalNameDTO):
                completion(.success(festivalNameDTO.nom))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }



[07:46]
je serai jamais là à 8h déso je finis juste dao, dto, je m'habille et je pars
 
Maxime — Aujourd’hui à 08:01
Pas de soucis
 
Lexay — Aujourd’hui à 08:58
//
//  AffectationCreneauDAO.swift
//  Projet Mobile
//
//  Created by m1 on 03/04/2023.
//
Afficher plus

AffectationCreneauDAO.swift
5 Ko



//
//  AffectationCreneauDTO.swift
//  Projet Mobile
//
//  Created by m1 on 03/04/2023.
//
Afficher plus

AffectationCreneauDTO.swift
2 Ko



//
//  AffectationCreneauListVM.swift
//  Projet Mobile
//
//  Created by m1 on 03/04/2023.
//
Afficher plus

AffectationCreneauListVM.swift
1 Ko



//
//  AffectationCreneauVM.swift
//  Projet Mobile
//
//  Created by m1 on 03/04/2023.
//
Afficher plus

AffectationCreneauVM.swift
1 Ko








Envoyer un message à @Maxime
﻿







 pour sélectionner

//
//  AffectationCreneauDAO.swift
//  Projet Mobile
//
//  Created by m1 on 03/04/2023.
//

import Foundation

class AffectationCreneauDAO {
    private let baseURL = MyEnvVariables().API_URL + "affectation_creneaux"

    func createAffectationCreneau(affectationCreneau: AffectationCreneauVM, completion: @escaping (Result<AffectationCreneauVM, Error>) -> Void) {
        let url = URL(string: baseURL)!
        let affectationCreneauDTO = AffectationCreneauDTO.fromModel(affectationCreneau)
        
        Task {
            switch await URLSession.shared.create(from: url, element: affectationCreneauDTO) as Result<AffectationCreneauDTO, APIError> {
            case .success(let affectationCreneauDTO):
                let affectationCreneau = affectationCreneauDTO.toModel()
                completion(.success(affectationCreneau))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func findAll(completion: @escaping (Result<[AffectationCreneauVM], Error>) -> Void) {
        let url = URL(string: baseURL)!
        
        Task {
            switch await URLSession.shared.getJSON(from: url) as Result<[AffectationCreneauDTO], APIError> {
            case .success(let affectationCreneauDTOs):
                let affectationCreneaux = affectationCreneauDTOs.map { $0.toModel() }
                completion(.success(affectationCreneaux))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func findOne(id_creneau: Int, id_benevole: Int, completion: @escaping (Result<AffectationCreneauVM, Error>) -> Void) {
        let url = URL(string: "\(baseURL)/\(id_creneau)&\(id_benevole)")!
        
        Task {
            switch await URLSession.shared.getJSON(from: url) as Result<AffectationCreneauDTO, APIError> {
            case .success(let affectationCreneauDTO):
                let affectationCreneau = affectationCreneauDTO.toModel()
                completion(.success(affectationCreneau))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func deleteOne(id_creneau: Int, id_benevole: Int, completion: @escaping (Result<Bool, Error>) -> Void) {
        let url = URL(string: "\(baseURL)/\(id_creneau)&\(id_benevole)")!
        
        Task {
            switch await URLSession.shared.delete(from: url, id: 0) as Result<Bool, APIError> {
            case .success(let success):
                completion(.success(success))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func findAllAffectationOfOneBenevole(id: Int, completion: @escaping (Result<[AffectationCreneauVM], Error>) -> Void) {
        let url = URL(string: "\(baseURL)/benevole/\(id)")!
        
        Task {
            switch await URLSession.shared.getJSON(from: url) as Result<[AffectationCreneauDTO], APIError> {
            case .success(let affectationCreneauDTOs):
                let affectationCreneaux = affectationCreneauDTOs.map { $0.toModel() }
                completion(.success(affectationCreneaux))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func findAllAffectationOfOneFZ(id: Int, completion: @escaping (Result<[AffectationCreneauVM], Error>) -> Void) {
        let url = URL(string: "\(baseURL)/festivalZone/\(id)")!
        
        Task {
            switch await URLSession.shared.getJSON(from: url) as Result<[AffectationCreneauDTO], APIError> {
            case .success(let affectationCreneauDTOs):
                let affectationCreneaux = affectationCreneauDTOs.map { $0.toModel() }
                completion(.success(affectationCreneaux))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func findAllAffectationOfOneCreneau(id: Int, completion: @escaping (Result<[AffectationCreneauVM], Error>) -> Void) {
        let url = URL(string: "\(baseURL)/creneau/\(id)")!
        
        Task {
            switch await URLSession.shared.getJSON(from: url) as Result<[AffectationCreneauDTO], APIError> {
            case .success(let affectationCreneauDTOs):
                let affectationCreneaux = affectationCreneauDTOs.map { $0.toModel() }
                completion(.success(affectationCreneaux))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
