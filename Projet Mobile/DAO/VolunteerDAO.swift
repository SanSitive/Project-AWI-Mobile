//
//  VolunteerDAO.swift
//  Projet Mobile
//
//  Created by Lexay on 24/03/2023.
//

import Foundation

class VolunteerDAO {
    private let baseURL = MyEnvVariables().API_URL + "benevoles"
    private let baseURLCreate = MyEnvVariables().API_URL + "authMobile"

    func fetchVolunteers(completion: @escaping (Result<[VolunteerVM], Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(APIError.urlNotFound(baseURL)))
            return
        }
        
        Task {
            switch await URLSession.shared.getJSON(from: url) as Result<[VolunteerDTO], APIError> {
            case .success(let volunteerDTOs):
                let volunteers = volunteerDTOs.map { $0.toModel() }
                completion(.success(volunteers))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func createVolunteer(volunteer: VolunteerVM, password: String, completion: @escaping (Result<VolunteerVM, Error>) -> Void) {
        guard let url = URL(string: baseURLCreate) else {
            completion(.failure(APIError.urlNotFound(baseURL)))
            return
        }
        
        let volunteerDTO = VolunteerDTO.fromModel(volunteer, password: password)

        Task {
            switch await URLSession.shared.create(from: url, element: volunteerDTO) as Result<VolunteerDTO, APIError> {
            case .success(let volunteerDTO):
                let volunteer = volunteerDTO.toModel()
                completion(.success(volunteer))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func updateVolunteer(volunteer: VolunteerVM, completion: @escaping (Result<Bool, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/\(volunteer.id)") else {
            completion(.failure(APIError.urlNotFound(baseURL)))
            return
        }
        
        let volunteerDTO = VolunteerDTO.fromModel(volunteer)

        Task {
            switch await URLSession.shared.update(from: url, element: volunteerDTO) as Result<Bool, APIError> {
            case .success(let success):
                completion(.success(success))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func deleteVolunteer(id: Int, completion: @escaping (Result<Bool, Error>) -> Void) {
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
