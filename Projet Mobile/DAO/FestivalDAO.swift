//
//  FestivalDAO.swift
//  Projet Mobile
//
//  Created by etud on 21/03/2023.
//

import Foundation

class FestivalDAO {
    private let baseURL = MyEnvVariables().API_URL + "festivals"

    func fetchFestivals(completion: @escaping (Result<[FestivalVM], Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(APIError.urlNotFound(baseURL)))
            return
        }
        
        Task {
            switch await URLSession.shared.getJSON(from: url) as Result<[FestivalDTO], APIError> {
            case .success(let festivalDTOs):
                let festivals = festivalDTOs.map { $0.toModel() }
                completion(.success(festivals))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func createFestival(festival: FestivalVM, completion: @escaping (Result<FestivalVM, Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(APIError.urlNotFound(baseURL)))
            return
        }
        
        let festivalDTO = FestivalDTO.fromModel(festival)

        Task {
            switch await URLSession.shared.create(from: url, element: festivalDTO) as Result<FestivalDTO, APIError> {
            case .success(let festivalDTO):
                let festival = festivalDTO.toModel()
                completion(.success(festival))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func updateFestival(festival: FestivalVM, completion: @escaping (Result<Bool, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/\(festival.id)") else {
            completion(.failure(APIError.urlNotFound(baseURL)))
            return
        }
        
        let festivalDTO = FestivalDTO.fromModel(festival)

        Task {
            switch await URLSession.shared.update(from: url, element: festivalDTO) as Result<Bool, APIError> {
            case .success(let success):
                completion(.success(success))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func deleteFestival(id: Int, completion: @escaping (Result<Bool, Error>) -> Void) {
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




