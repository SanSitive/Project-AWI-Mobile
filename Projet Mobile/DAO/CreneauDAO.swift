//
//  CreneauDAO.swift
//  Projet Mobile
//
//  Created by etud on 27/03/2023.
//

import Foundation

class CreneauDAO {
    private let baseURL = MyEnvVariables().API_URL + "creneaux"

    func fetchCreneaux(completion: @escaping (Result<[CreneauVM], Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(APIError.urlNotFound(baseURL)))
            return
        }
        
        Task {
            switch await URLSession.shared.getJSON(from: url) as Result<[CreneauDTO], APIError> {
            case .success(let creneauDTOs):
                let creneaux = creneauDTOs.map { $0.toModel() }
                completion(.success(creneaux))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func createCreneau(creneau: CreneauVM, completion: @escaping (Result<Int, Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(APIError.urlNotFound(baseURL)))
            return
        }
        
        let creneauDTO = CreneauDTO.fromModel(creneau)

        Task {
            switch await URLSession.shared.create(from: url, element: creneauDTO) as Result<Int, APIError> {
            case .success(let id):
                completion(.success(id))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func updateCreneau(creneau: CreneauVM, completion: @escaping (Result<Bool, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/\(creneau.id)") else {
            completion(.failure(APIError.urlNotFound(baseURL)))
            return
        }
        
        let creneauDTO = CreneauDTO.fromModel(creneau)

        Task {
            switch await URLSession.shared.update(from: url, element: creneauDTO) as Result<Bool, APIError> {
            case .success(let success):
                completion(.success(success))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func deleteCreneau(id: Int, completion: @escaping (Result<Bool, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/\(id)") else {
            completion(.failure(APIError.urlNotFound(baseURL)))
            return
        }

        Task {
            switch await URLSession.shared.delete(from: url, id: id) as Result<Bool, APIError> {
            case .success(let success):
                completion(.success(success))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
