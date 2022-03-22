//
//  Network.swift
//  Eticaret
//
//  Created by yunus oktay on 22.03.2022.
//

import Foundation

struct Network {
    private let baseURL = "http://159.223.0.153"
    
    func request<T: Codable>(with type: RequestType, completion: @escaping (Result<T, CustomError>) -> Void) {
        guard let url = URL(string: baseURL + type.endPoint) else {return}
        
        var req = URLRequest(url: url)
        req.httpMethod = type.httpMethod.rawValue
        
        URLSession.shared.dataTask(with: req) { data, response, error in
            if error != nil {
                return
            }
            
            guard let data = data else {return}
            
            let decoder = JSONDecoder()
            do {
                
                let jsonStr = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                print(jsonStr)
                let json = try decoder.decode(T.self, from: data)
                
                completion(.success(json))
                
            } catch {
                print(error)
                completion(.failure(CustomError(message: "decoding error")))
            }
        }.resume()
    }
}


struct CustomError: Error {
    let message: String
}

