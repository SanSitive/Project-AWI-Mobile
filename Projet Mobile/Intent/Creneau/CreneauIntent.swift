//
//  CreneauIntent.swift
//  Projet Mobile
//
//  Created by Lexay on 31/03/2023.
//

import Foundation

struct CreneauIntent {
    let dao = CreneauDAO()
    let viewModel: CreneauListVM

    enum Action {
        case create(CreneauVM)
        case read
        case update(CreneauVM)
        case delete(Int)
    }

    func perform(action: Action) {
        switch action {
        case .create(let creneau):
            createCreneau(creneau)
        case .read:
            fetchCreneaux()
        case .update(let creneau):
            updateCreneau(creneau)
        case .delete(let id):
            deleteCreneau(withId: id)
        }
    }

    private func fetchCreneaux() {
        dao.fetchCreneaux { result in
            switch result {
            case .success(let fetchedCreneaux):
                DispatchQueue.main.async {
                    viewModel.creneaux = fetchedCreneaux
                }
            case .failure(let error):
                print("Error fetching creneaux: \(error)")
            }
        }
    }

    private func createCreneau(_ creneau: CreneauVM) {
        dao.createCreneau(creneau: creneau) { result in
            switch result {
            case .success(let creneauVM):
                DispatchQueue.main.async {
                    viewModel.appendCreneau(creneauVM)
                }
            case .failure(let error):
                print("Error creating creneau: \(error)")
            }
        }
    }

    private func updateCreneau(_ creneau: CreneauVM) {
        dao.updateCreneau(creneau: creneau) { result in
            switch result {
            case .success(let success):
                if success {
                    DispatchQueue.main.async {
                        viewModel.updateCreneau(creneau)
                    }
                }
            case .failure(let error):
                print("Error updating creneau: \(error)")
            }
        }
    }

    private func deleteCreneau(withId id: Int) {
        dao.deleteCreneau(id: id) { result in
            switch result {
            case .success(let success):
                if success {
                    DispatchQueue.main.async {
                        viewModel.removeCreneau(withId: id)
                    }
                }
            case .failure(let error):
                print("Error deleting creneau: \(error)")
            }
        }
    }
}
