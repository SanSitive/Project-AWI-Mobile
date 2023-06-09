//
//  RequestExtension.swift
//  Projet Mobile
//
//  Created by Lexay on 24/03/2023.
//

import Foundation

struct IdDTO: Codable {

    var ID:Int

    init(ID:Int){
        self.ID = ID
    }
}

extension URLSession {

    func getJSON<T:Decodable>(from url:URL) async -> Result<T, APIError>{
        guard let(data,_) = try? await data(from: url) else {
            return .failure(.urlNotFound(url.absoluteString))
        }
        guard let decoded = try? JSONDecoder().decode(T.self, from: data) else {
            print(String(decoding: data,as: UTF8.self))
            return .failure(.JsonDecodingFailed)
        }
        return .success(decoded)
    }
    
    func create<T:Codable>(from url:URL,element:T)async -> Result<T, APIError>{
        debugPrint("element= ", element)
        guard let encoded :Data = try? JSONEncoder().encode(element)else {
            return .failure(.JsonEncodingFailed)
        }
        var request :URLRequest = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        debugPrint("requests: ", request)
        do {
            let (data,response) = try await upload(for: request, from: encoded, delegate: nil)
            let httpResponse = response as! HTTPURLResponse
            if httpResponse.statusCode == 201 || httpResponse.statusCode == 200 {
                guard let decoded = try? JSONDecoder().decode(T.self, from: data) else {
                    print(String(decoding: data,as: UTF8.self))
                    return .failure(.JsonDecodingFailed)
                }
                return .success(decoded)
            }
            else {
                return .failure(.httpResponseError(httpResponse.statusCode))
            }
        }
        catch{
            return .failure(.urlNotFound(url.absoluteString))
        }
    }

    func update<T:Encodable>(from url:URL,element:T)async -> Result<Bool, APIError>{
        guard let encoded :Data = try? JSONEncoder().encode(element)else {
            return .failure(.JsonEncodingFailed)
        }
        var request :URLRequest = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
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

    func delete(from url:URL,id:Int)async -> Result<Bool, APIError>{
        guard let encoded :Data = try? JSONEncoder().encode(IdDTO(ID: id))else {
            return .failure(.JsonEncodingFailed)
        }
        var request :URLRequest = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        do{
            let (_,response) = try await upload(for: request, from: encoded, delegate: nil)
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
    
    func postJSON<T: Codable, U: Codable>(from url: URL, element: U) async -> Result<T, APIError> {
        guard let encoded: Data = try? JSONEncoder().encode(element) else {
            return .failure(.JsonEncodingFailed)
        }
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            let (data, response) = try await URLSession.shared.upload(for: request, from: encoded, delegate: nil)
            let httpResponse = response as! HTTPURLResponse
            if httpResponse.statusCode == 201 || httpResponse.statusCode == 200 {
                guard let decoded = try? JSONDecoder().decode(T.self, from: data) else {
                    print(String(decoding: data, as: UTF8.self))
                    return .failure(.JsonDecodingFailed)
                }
                return .success(decoded)
            } else {
                return .failure(.httpResponseError(httpResponse.statusCode))
            }
        } catch {
            return .failure(.urlNotFound(url.absoluteString))
        }
    }
}
