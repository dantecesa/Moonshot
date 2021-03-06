//
//  Astronaut-Decoder.swift
//  Moonshot
//
//  Created by Dante Cesa on 1/20/22.
//

import Foundation

extension Bundle {
    
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("We could not find \(file) in the bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("We could not load data from \(file).")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "yy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let decoded_data = try? decoder.decode(T.self, from: data) else {
            fatalError("We could not decode data in \(file).")
        }
        
        return decoded_data
    }
}
