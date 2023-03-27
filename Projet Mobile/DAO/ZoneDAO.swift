//
//  ZoneDAO.swift
//  Projet Mobile
//
//  Created by etud on 27/03/2023.
//

import Foundation

struct LabelDTO: Codable {
    var label: String

    init(label: String){
        self.label = label
    }
}

class ZoneDAO {
    private let baseURL = MyEnvVariables().API_URL + "zones"

    func fetchZones(completion: @escaping (Result<[ZoneVM], Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(APIError.urlNotFound(baseURL)))
            return
        }
        
        Task {
            switch await URLSession.shared.getJSON(from: url) as Result<[ZoneDTO], APIError> {
            case .success(let zoneDTOs):
                let zones = zoneDTOs.map { $0.toModel() }
                completion(.success(zones))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func createZone(zone: ZoneVM, completion: @escaping (Result<Int, Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(APIError.urlNotFound(baseURL)))
            return
        }
        
        let zoneDTO = ZoneDTO.fromModel(zone)

        Task {
            switch await URLSession.shared.create(from: url, element: zoneDTO) as Result<Int, APIError> {
            case .success(let id):
                completion(.success(id))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func updateZone(zone: ZoneVM, completion: @escaping (Result<Bool, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/\(zone.label)") else {
            completion(.failure(APIError.urlNotFound(baseURL)))
            return
        }
        
        let zoneDTO = ZoneDTO.fromModel(zone)

        Task {
            switch await URLSession.shared.update(from: url, element: zoneDTO) as Result<Bool, APIError> {
            case .success(let success):
                completion(.success(success))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func deleteZone(label: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/\(label)") else {
            completion(.failure(APIError.urlNotFound(baseURL)))
            return
        }

        Task {
            switch await deleteAux(from: url, label: label) as Result<Bool, APIError> {
            case .success(let success):
                completion(.success(success))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func deleteAux(from url:URL,label:String)async -> Result<Bool, APIError>{
        guard let encoded :Data = try? JSONEncoder().encode(LabelDTO(label: label)) else {
            return .failure(.JsonEncodingFailed)
        }
        var request :URLRequest = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        do{
            let (_,response) = try await URLSession.shared.upload(for: request, from: encoded, delegate: nil)
            let httpResponse = response as! HTTPURLResponse
            if httpResponse.statusCode == 201 || httpResponse.statusCode == 200 {
                return .success(true)
            }
            else {
                return .failure(.httpResponseError(httpResponse.statusCode))
            }
        }
        catch{
            return .failure(.urlNotFound(url.absoluteString))
        }
    }
    
    
}



