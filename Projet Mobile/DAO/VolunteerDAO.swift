//
//  VolunteerDAO.swift
//  Projet Mobile
//
//  Created by Lexay on 24/03/2023.
//

import Foundation

class VolunteerDAO {
    private let baseURL = MyEnvVariables().API_URL + "benevoles"

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

    func createVolunteer(volunteer: VolunteerVM, completion: @escaping (Result<Int, Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(APIError.urlNotFound(baseURL)))
            return
        }
        
        let volunteerDTO = VolunteerDTO.fromModel(volunteer)

        Task {
            switch await URLSession.shared.create(from: url, element: volunteerDTO) as Result<Int, APIError> {
            case .success(let id):
                completion(.success(id))
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
    
    
    func main(){
         
        fetchVolunteers { result in
            switch result {
            case .success(let volunteers):
                // Do something with the array of Volunteer objects
                debugPrint(volunteers)
            case .failure(let error):
                debugPrint(error)
                // Handle the error
            }
        }
    }
}



/*import Foundation

struct Ben: Codable {
    let token: String
    let benevole: BenevoleDTO

    init(token: String, benevole: BenevoleDTO) {
        self.token = token
        self.benevole = benevole
    }
}

struct Connect: Codable {
    let mail: String
    let password: String
}

struct BenevoleId: Codable {
    let id: Int
}

struct BenevoleDAO {

    var API: String
    
    init(api:String){
        self.API = api + "/benevole"
    }
    
    func getAll() async -> [Benevole] {
        let data:Result<[BenevoleDTO],APIError> = await URLSession.shared.getJSON(from: URL(string: self.API)!)
        switch data {
            case .success(let DTO):
                var benevoleList: [Benevole] = DTO.compactMap {
                    Benevole(benevoleDTO: $0)
                }
                return benevoleList
            case .failure(let err):
                print("Erreur : \(err)")
                return []
        }
    }
    
    func create(benevole: Benevole) async -> Result<Int,APIError> {
        let benevoleDTO = BenevoleDTO(benevole: benevole)
        return await URLSession.shared.create(from: URL(string: self.API)!, element: benevoleDTO)
    }
    
    func update(benevole: Benevole) async -> Result<Bool,APIError> {
        let benevoleDTO = BenevoleDTO(benevole: benevole)
        return await URLSession.shared.update(from: URL(string: self.API)!, element: benevoleDTO)
    }
    
    func delete(id: Int) async -> Result<Bool,APIError>{
        return await URLSession.shared.delete(from: URL(string: self.API)!, id: id)
    }

    func auth(token: String) async -> Result<Int, APIError> {
        let url: URL = URL(string: self.API + "/auth")!
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(token, forHTTPHeaderField: "token")
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            let httpResponse = response as! HTTPURLResponse
            guard httpResponse.statusCode == 200 else {
                return .failure(.httpResponseError(httpResponse.statusCode))
            }
            let decoder = JSONDecoder()
            let benevole = try decoder.decode(BenevoleId.self, from: data)
            return .success(benevole.id)
        }
        catch {
            return .failure(.urlNotFound(url.absoluteString))
        }
    }

    func getOne(id: Int) async -> Result<Benevole,APIError> {
        let data:Result<BenevoleDTO,APIError> = await URLSession.shared.getJSON(from: URL(string: self.API + "/" + String(id))!)
        switch data {
            case .success(let DTO):
                let benevole: Benevole = Benevole(benevoleDTO: DTO)
                return .success(benevole)
            case .failure(let err):
                print("Erreur : \(err)")
                return .failure(err)
        }
    }

    func connect(mail: String, password: String) async -> Result<Ben, APIError> {
        let url: URL = URL(string: self.API + "/connect")!
        guard let encoded :Data = try? JSONEncoder().encode(Connect(mail: mail, password: password))else {
            return .failure(.JsonEncodingFailed)
        }
        var request :URLRequest = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            let (data,response) = try await URLSession.shared.upload(for: request, from: encoded, delegate: nil)
            let httpResponse = response as! HTTPURLResponse
            if httpResponse.statusCode == 201 || httpResponse.statusCode == 200 {
                guard let ben = try? JSONDecoder().decode(Ben.self, from: data) else{
                    return .failure(.JsonDecodingFailed)
                }
                return .success(ben)
            }
            else {
                return .failure(.httpResponseError(httpResponse.statusCode))
            }
        }
        catch{
            return .failure(.urlNotFound(url.absoluteString))
        }
    }
}*/
