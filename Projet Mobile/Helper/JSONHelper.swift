//
//  JSONHelper.swift
//  Projet Mobile
//
//  Created by etud on 21/03/2023.
//

import Foundation

struct JSONHelper{
   static func loadFromFile(name:String, extension: String) async -> Data?{
      guard let fileURL = Bundle.main.url(forResource: "playlist", withExtension: "json") else { return nil }
      guard let fileContents = try? Data(contentsOf: fileURL) else { return nil }
      return fileContents
   }
   
   static func encode<T: Encodable>(data: T) async -> Data?{
      let encoder = JSONEncoder()
      return try? encoder.encode(data)
   }
    
    static func decode<T: Decodable>(data: Data) -> T? {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let customDateDecodingStrategy = JSONDecoder.DateDecodingStrategy.custom { decoder in
                let container = try decoder.singleValueContainer()
                let dateString = try container.decode(String.self)
                guard let date = dateFormatter.date(from: dateString) else {
                    throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date format")
                }
                return date
            }
            
            let decoder = JSONDecoder() // création d'un décodeur
            decoder.dateDecodingStrategy = customDateDecodingStrategy
            if let decoded = try? decoder.decode(T.self, from: data) {
                debugPrint("test \(decoded)")
                return decoded
            }
            return nil
        }
}
