//
//  FestivalZoneDAO.swift
//  Projet Mobile
//
//  Created by etud on 28/03/2023.
//

import Foundation
class FestivalZoneDAO {
    private let baseURL = MyEnvVariables().API_URL + "festival_zones"

    func fetchFestivalZones(completion: @escaping (Result<[FestivalZoneVM], Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(APIError.urlNotFound(baseURL)))
            return
        }
        
        Task {
            switch await URLSession.shared.getJSON(from: url) as Result<[FestivalZoneDTO], APIError> {
            case .success(let festival_zoneDTOs):
                let festival_zones = festival_zoneDTOs.map { $0.toModel() }
                completion(.success(festival_zones))
            case .failure(let error):                completion(.failure(error))
            }
        }
    }

    func createFestivalZone(festival_zone: FestivalZoneVM, completion: @escaping (Result<FestivalZoneVM, Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(APIError.urlNotFound(baseURL)))
            return
        }
        
        let festival_zoneDTO = FestivalZoneDTO.fromModel(festival_zone)

        Task {
            switch await URLSession.shared.create(from: url, element: festival_zoneDTO) as Result<FestivalZoneDTO, APIError> {
            case .success(let festivalZoneDTO):
                let festivalZone = festivalZoneDTO.toModel()
                completion(.success(festivalZone))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func updateFestivalZone(festival_zone: FestivalZoneVM, completion: @escaping (Result<Bool, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/\(festival_zone.id_festivalZone)") else {
            completion(.failure(APIError.urlNotFound(baseURL)))
            return
        }
        
        let festival_zoneDTO = FestivalZoneDTO.fromModel(festival_zone)

        Task {
            switch await URLSession.shared.update(from: url, element: festival_zoneDTO) as Result<Bool, APIError> {
            case .success(let success):
                completion(.success(success))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func deleteFestivalZone(id: Int, completion: @escaping (Result<Bool, Error>) -> Void) {
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




