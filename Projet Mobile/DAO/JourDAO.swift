//
//  JourDAO.swift
//  Projet Mobile
//
//  Created by etud on 27/03/2023.
//

import Foundation

class JourDAO {
    private let baseURL = MyEnvVariables().API_URL + "jours"

    func fetchJours(completion: @escaping (Result<[JourVM], Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(APIError.urlNotFound(baseURL)))
            return
        }
        
        Task {
            switch await URLSession.shared.getJSON(from: url) as Result<[JourDTO], APIError> {
            case .success(let jourDTOs):
                let jours = jourDTOs.map { $0.toModel() }
                completion(.success(jours))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func createJour(jour: JourVM, completion: @escaping (Result<Int, Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(APIError.urlNotFound(baseURL)))
            return
        }
        
        let jourDTO = JourDTO.fromModel(jour)

        Task {
            switch await URLSession.shared.create(from: url, element: jourDTO) as Result<Int, APIError> {
            case .success(let id):
                completion(.success(id))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func updateJour(jour: JourVM, completion: @escaping (Result<Bool, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/\(jour.id)") else {
            completion(.failure(APIError.urlNotFound(baseURL)))
            return
        }
        
        let jourDTO = JourDTO.fromModel(jour)

        Task {
            switch await URLSession.shared.update(from: url, element: jourDTO) as Result<Bool, APIError> {
            case .success(let success):
                completion(.success(success))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func deleteJour(id: Int, completion: @escaping (Result<Bool, Error>) -> Void) {
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




