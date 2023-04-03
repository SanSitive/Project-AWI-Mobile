//
//  AffectationCreneauIntent.swift
//  Projet Mobile
//
//  Created by etud on 03/04/2023.
//

import Foundation

struct AffectationCreneauIntent {
    let dao = AffectationCreneauDAO()
    let viewModel: AffectationCreneauListVM

    enum Action {
        case create(AffectationCreneauVM)
        case read
        case delete(Int, Int)
    }

    func perform(action: Action) {
        switch action {
        case .create(let affectationCreneau):
            createAffectationCreneau(affectationCreneau)
        case .read:
            fetchAffectationCreneaux()
        case .delete(let id_creneau, let id_benevole):
            deleteAffectationCreneau(id_creneau: id_creneau, id_benevole: id_benevole)
        }
    }

    private func fetchAffectationCreneaux() {
        dao.findAll { result in
            switch result {
            case .success(let fetchedAffectationCreneaux):
                DispatchQueue.main.async {
                    viewModel.affectationCreneaux = fetchedAffectationCreneaux
                }
            case .failure(let error):
                print("Error fetching affectation creneaux: \(error)")
            }
        }
    }

    private func createAffectationCreneau(_ affectationCreneau: AffectationCreneauVM) {
        dao.createAffectationCreneau(affectationCreneau: affectationCreneau) { result in
            switch result {
            case .success(let affectationCreneauVM):
                DispatchQueue.main.async {
                    viewModel.appendAffectationCreneau(affectationCreneauVM)
                }
            case .failure(let error):
                print("Error creating affectation creneau: \(error)")
            }
        }
    }

    private func deleteAffectationCreneau(id_creneau: Int, id_benevole: Int) {
        dao.deleteOne(id_creneau: id_creneau, id_benevole: id_benevole) { result in
            switch result {
            case .success(let success):
                if success {
                    DispatchQueue.main.async {
                        viewModel.removeAffectationCreneau(withId: id_creneau)
                    }
                }
            case .failure(let error):
                print("Error deleting affectation creneau: \(error)")
            }
        }
    }
}

