//
//  RMService.swift
//  Projet Mobile
//
//  Created by etud on 17/03/2023.
//

import Foundation


final class RMService {
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///  - request : Request instance
    ///  - type : The type of object we expect to get back
    ///  - completion: callback with data or error
    
    public func execute<T: Codable>(
        _ request : RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ){
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            
            //Decode response
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }
            catch{
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
}
