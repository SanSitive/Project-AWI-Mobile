//
//  AuthDAO.swift
//  Projet Mobile
//
//  Created by etud on 21/03/2023.
//

import Foundation

struct UserCredentials: Codable {
    let email: String
    let password: String
}

struct SignupData: Codable {
    let prenom: String
    let nom: String
    let email: String
    let password: String
    let isAdmin: Bool
}

class AuthDAO {
    private let baseURLLogin = MyEnvVariables().API_URL + "authMobile/signinMobile"
    private let baseURLSignup = MyEnvVariables().API_URL + "authMobile/signupMobile"

    func login(username: String, password: String, completion: @escaping (Result<VolunteerDTO, Error>) -> Void) {
        guard let url = URL(string: baseURLLogin) else {
            completion(.failure(APIError.urlNotFound(baseURLLogin)))
            return
        }
        
        let credentials = UserCredentials(email: username, password: password)

        Task {
            switch await URLSession.shared.postJSON(from: url, element: credentials) as Result<VolunteerDTO, APIError> {
            case .success(let volunteerDTO):
                completion(.success(volunteerDTO))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func signup(firstName: String, lastName: String, email: String, password: String, isAdmin: Bool, completion: @escaping (Result<VolunteerDTO, Error>) -> Void) {
            guard let url = URL(string: baseURLSignup) else {
                completion(.failure(APIError.urlNotFound(baseURLSignup)))
                return
            }
            
        let signupData = SignupData(prenom: firstName, nom: lastName, email: email, password: password, isAdmin: isAdmin)

            Task {
                switch await URLSession.shared.postJSON(from: url, element: signupData) as Result<VolunteerDTO, APIError> {
                case .success(let volunteerDTO):
                    completion(.success(volunteerDTO))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
}
