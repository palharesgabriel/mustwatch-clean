//
//  Coder.swift
//  data
//
//  Created by Gabriel Palhares on 18/06/21.
//

import Foundation

public class Coder {
    
    private var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy
    
    public init(decodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) {
        keyDecodingStrategy = decodingStrategy
    }
    
    func decode<T: Codable>(toType myType: T.Type, from jsonData: Data) -> T? {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = self.keyDecodingStrategy
            
            let decodedData: T = try decoder.decode(myType, from: jsonData)
            return decodedData
        } catch let error {
            print("json decode error", error)
        }
        return nil
    }
    
    func encode<T: Codable>(fromCodable codable: T) -> Data? {
        do {
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(codable)
            return encodedData
        } catch let error {
            print("json encode error", error)
        }
        return nil
    }
}
